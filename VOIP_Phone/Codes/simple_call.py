#VOIP 
#Simple Calling group no 15 

import sys
import pjsua as pj
import threading

LOG_LEVEL=4    #Input Verbosity level
current_call = None

#Parameters Configuration for Sound 
input_volume = 0.5
output_volume = 0.5
in_device = -1
out_device = -2
in_sel_device = -1
out_sel_device = -1

player_in_id = None
player_out_id = None

#Ring tones 
in_call_ring_tone = "./ring_in_call.wav"   
out_call_ring_tone = "./ring_out_call.wav"  

 
local_hungup = False


# Logging callback
def log_cb(level, str, len):
    print str


#This will start ring tone when it initiate or receive any call 
def _start_call_sound_out():
    global player_out_id,input_volume, output_volume, voip_root_dir   
    sound_file = out_call_ring_tone
    player_out_id = pj.Lib.instance().create_player(sound_file,loop=True)
    pj.Lib.instance().conf_set_tx_level(player_out_id,output_volume)
    pj.Lib.instance().conf_connect(pj.Lib.instance().player_get_slot(player_out_id), 0)

#to stop the ringtone 
def _stop_call_sound():
    global player_out_id, player_in_id
    
    if player_out_id!=None:
        _stop_call_sound_out()
    if player_in_id!=None:
        _stop_call_sound_in()


def _stop_call_sound_out():
    global player_out_id
    if player_out_id!=None:
        pj.Lib.instance().player_set_pos(player_out_id,0)
        pj.Lib.instance().conf_disconnect(pj.Lib.instance().player_get_slot(player_out_id), 0)
     

def _start_call_sound_in():
    global player_in_id, voip_root_dir
    if player_in_id==None:
        sound_file = in_call_ring_tone
        player_in_id = pj.Lib.instance().create_player(sound_file,loop=True)
        pj.Lib.instance().conf_set_tx_level(player_in_id,output_volume)
    
    pj.Lib.instance().conf_connect(pj.Lib.instance().player_get_slot(player_in_id), 0)


def _stop_call_sound_in():
    global player_in_id
    if player_in_id!=None:
        pj.Lib.instance().player_set_pos(player_in_id,0)
        pj.Lib.instance().conf_disconnect(pj.Lib.instance().player_get_slot(player_in_id), 0)
    

# Callback to receive events from account
class MyAccountCallback(pj.AccountCallback):

    def __init__(self, account=None):
        pj.AccountCallback.__init__(self, account)

    # Notification on incoming call
    def on_incoming_call(self, call):
        global current_call
	#If Call is activated an another user is trying to contect he or she will receive the 486 error saying user is busy  
        if current_call:
            _stop_call_sound()
            call.answer(486, "Busy")
            return
           
	#Other wise call will be established 
        print "Incoming call from ", call.info().remote_uri
        print "Press 'a' to answer"

        current_call = call
        _start_call_sound_in()

        call_cb = MyCallCallback(current_call)
        current_call.set_callback(call_cb)
	#Here 180 indicates that call has been established at remote side but yet the remote person has not responded it  
        current_call.answer(180)
    
    #For Concurrancy Control 	
    def wait(self):
	
        self.sem = threading.Semaphore(0)
        self.sem.acquire()

    def on_reg_state(self):
        if self.sem:
            if self.account.info().reg_status >= 200:
                self.sem.release()

       
# Callback to receive events from Call
class MyCallCallback(pj.CallCallback):

    def __init__(self, call=None):
        pj.CallCallback.__init__(self, call)

    # Notification when call state has changed
    def on_state(self):
        global current_call
        print "Call with", self.call.info().remote_uri,
        print "is", self.call.info().state_text,
        print "last code =", self.call.info().last_code, 
        print "(" + self.call.info().last_reason + ")"

        if((self.call.info().last_reason == "Busy Here") | (self.call.info().last_reason == "Request Terminated")):
            _stop_call_sound()
       
        if self.call.info().state == pj.CallState.DISCONNECTED:
            current_call = None
            print 'Current call is', current_call
	
    # Notification when call's media state has changed.
    def on_media_state(self):
        if self.call.info().media_state == pj.MediaState.ACTIVE:
            # Connect the call to sound device
            _stop_call_sound()

            #This function will get the call slot information of remote person 
	    call_slot = self.call.info().conf_slot
	    
	        #This conf_connect function indicate the connection like bridge between 
            #call slot (Remote person)and 0 is by default which indicates the sound devices.
            pj.Lib.instance().conf_connect(call_slot, 0)
            pj.Lib.instance().conf_connect(0, call_slot)
            print "Media is now active"
        else:
            print "Media is inactive"
            _stop_call_sound()


# Function to make call
def make_call(uri):
    try:
        print "Making call to", uri
        _start_call_sound_out()
        return acc.make_call(uri, cb=MyCallCallback())
    except pj.Error, e:
        print "Exception: " + str(e)
        return None
       

# Create library instance
lib = pj.Lib()

try:
    lib.init(log_cfg = pj.LogConfig(level=LOG_LEVEL, callback=log_cb))

    # Create UDP transport which listens to port 5080 you can use any port 
    lib.create_transport(pj.TransportType.UDP, pj.TransportConfig(5080))
    
    # Start the library
    lib.start()
	
    print "-------------------------"
    print "Welcome into VOIP Service"
    print "-------------------------"
   	
    # Create local account for the Asterisk Server
    ip_var = raw_input("Please Enter Asterisk Server IP:>")
    
    #User name and Password
    user =  raw_input("Please Enter Your Username:>")
    password = raw_input("Please Enter your Password:>")
    
    acc = lib.create_account(pj.AccountConfig(ip_var, user, password))  #change name here if you want

    acc_cb = MyAccountCallback(acc)
    acc.set_callback(acc_cb)
    acc_cb.wait()

    print "\n"
    print "Registration complete, status=", acc.info().reg_status, \
            "(" + acc.info().reg_reason + ")"
    print "\nPress ENTER to quit"
    sys.stdin.readline()


    # If argument is specified then make call to the URI
    if len(sys.argv) > 1:
        lck = lib.auto_lock()
        current_call = make_call(sys.argv[1])
        print 'Current call is', current_call
        del lck

    # Menu loop
    while True:
       
        print "Menu:  m=make call, h=hangup call, a=answer call, q=quit"

        input = sys.stdin.readline().rstrip("\r\n")
	#To Call some one         
	if input == "m":
            if current_call:
                print "Already have another call"
                continue
            print "Enter destination URI to call: ", 
            input = sys.stdin.readline().rstrip("\r\n")
            if input == "":
                continue
	    #Session will lock the process 
            lck = lib.auto_lock()
	    #Here what ever the name user has entered for calling will automatically converted into his sip based URI by applying the 
            #below string mechanism
            current_call = make_call("sip:"+str(input)+"@"+str(ip_var))
            del lck
	    #Unlock 
	
	#For hang up 
        elif input == "h":
            _stop_call_sound()
            if not current_call:
                print "There is no call"
                continue
            current_call.hangup()
	
        #For answering 
        elif input == "a":
            if not current_call:
                print "There is no call"
                continue
            current_call.answer(200)
	
	#Quit 
        elif input == "q":
            break

   # Shutdown the library
    transport = None
    acc.delete()
    acc = None
    lib.destroy()
    lib = None

except pj.Error, e:
    print "Exception: " + str(e)
    lib.destroy()
    lib = None
