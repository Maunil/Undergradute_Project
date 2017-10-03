import time
import serial
import sys
import glob
# configure the serial connections (the parameters differs on the device you are connecting to)
def serial_ports():
	""" Lists serial port names

		:raises EnvironmentError:
			On unsupported or unknown platforms
		:returns:
			A list of the serial ports available on the system
	"""
	if sys.platform.startswith('win'):
		ports = ['COM%s' % (i + 1) for i in range(256)]
	elif sys.platform.startswith('linux') or sys.platform.startswith('cygwin'):
		# this excludes your current terminal "/dev/tty"
		ports = glob.glob('/dev/tty[A-Za-z]*')
	elif sys.platform.startswith('darwin'):
		ports = glob.glob('/dev/tty.*')
	else:
		raise EnvironmentError('Unsupported platform')

	result = []
	for port in ports:
		try:
			s = serial.Serial(port)
			s.close()
			result.append(port)
		except (OSError, serial.SerialException):
			pass
	return result

if __name__ == '__main__':
	ports = serial_ports()
	print(ports);
	if ports!=[]:
		ser = serial.Serial(
			port=ports[0],
			baudrate=9600,
			parity=serial.PARITY_NONE,
			stopbits=serial.STOPBITS_ONE,
			bytesize=serial.EIGHTBITS
		)
		#RxTx
		ser.isOpen()
		ser.reset_output_buffer()
		ser.reset_input_buffer()
	else:
		ser = None
		print("\nNo COM ports available");
	out = ''
	con = 1
	productList = ['ProductA','ProductB','ProductC','ProductD','ProductE','ProductF','ProductG']
	name = input(">>Enter your name(Max 8 chars): ")
	concatenate = name + "*"
	while 1:
		for j,i in enumerate(productList): # j = index no.
			print("%d. %s" %(j+1,i));
		productID = input(">>Select a product no: ") #int input
		quantity = input(">>Select quantity: ") #string input
		concatenate += productID + "/" + quantity
		print(">>String: %s" %concatenate)
		check = input(">>Do you want to continue adding new product or not(proceed to transmitting)? y/n: ")
		if check == 'n' or check=='N':
			concatenate = concatenate.encode('utf-8')
			if ser is not None:
				print(">>Transmitting %s" %concatenate)
				ser.write(concatenate + '\r\n')
				print(">>Transmit Complete!")
				while ser.inWaiting() > 0:
					out += ser.read(1) #1 = no. of bytes
					#print out
					if out != '':
						print(">>UART Received String: " + out);
		
			time.sleep(1)
			out = ''
			
			con = input(">>Enter 1 to continue with a new resetted input or any key to exit the program: ")
			if con != 1:
				if ser is not None:
					ser.close()
				exit()
			name = input(">>Enter your name(Max 8 chars): ")
			concatenate = name + "*"
			con = ''
		elif check == 'y' or check == 'Y':
			concatenate = concatenate + "*"
#		if input=='exit':
#			ser.close()
#		