/*
 * SmartShop.c
 *
 * Created: 10-04-2016 10:48:23 PM
 * Author : Ramkabir
 */ 
#ifndef F_CPU
#define F_CPU 8000000UL
#endif


#include<avr/io.h>
#include<stdio.h>
#include<stdlib.h>
#include<util/delay.h>
#include<avr/interrupt.h>


//LCD Connections

///////////////////////////////////////////////////////////////////////////////////////////////////// LCD CODE

 /*
   Program :1 - a
   Display "Hello World"
 */
//////////////////////////////////////////////////////////
//Main Function

ISR (INT0_vect) // Count LED on every interrupt
{
	int DataCharCount=0;
	char TempData[45];
	char p;
	char *Data;
	int i;
	
	while(1)
	{
		while((UCSRA & (1<<7))==0);
		p = UDR;
		
		if(p=='\r')
		{
			break;
		}
		
		TempData[DataCharCount] = p;
		DataCharCount++;
	}

	Data=(char*)malloc((DataCharCount)*sizeof(char));

	for(i=0;i<DataCharCount;i++)
	{
		Data[i]=TempData[i];
	}
	
	interrupt(Data);
}
 
 

void LCD_data(unsigned char Data)// to provide data to LCD
{
    PORTC=Data&0xF0; // Send Higher nibble (D7-D4)
    
	PORTA|=(1<<0);       // Register Select =1 (for data select register)
    PORTD|=(1<<6);      //Enable=1 for H to L pulse
    
	_delay_us(5);
    
	PORTD^=(1<<6);

    PORTC=((Data<<4)&0xF0); // Send Lower nibble (D3-D0)
    PORTD|=(1<<6);               //Enable=1 for H to L pulse
    
	_delay_us(5);
    
	PORTD^=(1<<6);

    _delay_us(100);
}


//LCD Print
void LCD_Print(char * str)// to print string to LCD
{
     unsigned char i=0;
     // Till NULL charecter is reached, take each character
     while(*(str+i)!=0)
     {
		  LCD_data(*(str+i)); // Data sent to LCD data register
		  i++;
		  _delay_ms(10);
     }
}
//LCD Command
void lcdcommand(unsigned char command)// to provide command to LCD
{
    PORTC=command&0xF0; // Send Higher nibble (D7-D4)
    
	PORTA&=~(1<<0); // Register Select =0 (for Command register)
    PORTD|=(1<<6); //Enable=1 for H to L pulse
    
	_delay_us(5);
    PORTD^=(1<<6);
    _delay_us(100);

    PORTC=((command<<4)&0xF0);  // Send Lower nibble (D3-D0)
    PORTD|=(1<<6); //Enable=1 for H to L pulse
    _delay_us(5);
    PORTD^=(1<<6);

    _delay_us(40);
}

// Cursor Position
void Cursor_Position(unsigned short int x,unsigned short int y)
{
   unsigned char firstcharadd[] ={0x80,0xC0}; // First line address 0X80
                                              //Second line address 0XC0
   lcdcommand((firstcharadd[x-1]+y-1));// to get address line on LCD

}

void clear()// To clear LCD previous data
{
  lcdcommand(0x01); // to clear LCD
  _delay_ms(2);
}

 //LCD Iniatialize
void LCD_Initialize()
{
    PORTD&=~(1<<6);

    lcdcommand(0x33); // Initialize LCD for 4 bit mode
    lcdcommand(0x32); // Initialize LCD for 4 bit mode
    lcdcommand(0x28); // Initialize LCD for 5X7 matrix mode
    lcdcommand(0x0E); //Display on,cursor blinking
    clear();
    lcdcommand(0x06); //Shift cursor to right
    lcdcommand(0x80);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////
// USART RECEIVE CODE


void usart_initialize()
{
	UCSRB=0x18; // Rx Enable
	UCSRC=0x86; // Data Size : 8-bit, Stop Bit:1,No parity
	UBRRL=0x33; // X= (Fosc/(16(Desired Baud Rate)))-1
	//     =(8*10^6/(16 *9600))-1
	//     =52.08-1
	//     =51 (Dec)
	//Here, URSEl=0, so Fosc is divided by 16 if it was 1 Fosc would
	//Have been diveded by 8
}

//////////////////////////////////////////////////////////////////////////////////
//Node
int ProductPrice[6] = {0,50,150,210,120,144};// store price of product
int Quant;// global quantity

struct node
{
	int item;
	int Quantity;
	struct node *link;
}*top;

struct nodeQ
{
	int UserNo;
	int CurrentPos;
	int TotalPrice;        //To be displayed at LCD
	char *Username;
	struct nodeQ *linkQ;
	struct node *Stack;
} *front,*rear;

int Qsize=1;
int Ssize=0;
//////////////////////////////////////////////////////////////////////
//Queue

void insertQ(int val,int totPrice,char *Name,int c)
{
	struct nodeQ *temp;
	int k;
	temp=(struct nodeQ*)malloc(sizeof(*temp));

	temp->UserNo = val;
	temp->CurrentPos = 0;
	temp->TotalPrice = totPrice;        //To be displayed at LCD
	
	temp->Username = (char *)malloc((c) * sizeof(char));
	
	for(k=0;k<c;k++)
	{
		temp->Username[k] = Name[k];
	}
	
	temp->linkQ = '\0';
	temp->Stack = '\0';

	if (front == '\0')
	{
		front = temp;
		rear=temp;
	}
	else
	{
		rear->linkQ = temp;
		rear = temp;
	}

	Qsize++;
}


/*int deleteQ()		//Old One Only for Reference
{
	struct nodeQ *temp;
	int val;

	if (front == '\0')
	{
		val = -1;
	}
	else
	{
		val = front->UserNo;
		temp = front;

		if (front == rear)
		{
			rear = '\0';
			front = '\0';
		}
		else
		{
			front = front->linkQ;
		}

		Qsize--;
	}

	return val;
}
*/

struct nodeQ* getElementAddr(int i) // Get the Position value form array
{
	struct nodeQ *temp;
	int j;
	temp = front;

	if(i>Qsize||i<1)
	{
		return '\0';
	}

	for(j=1;j<i;j++)
	{
		temp = temp->linkQ;
	}

	return temp;
}

void Delete(int i)        // Queue delete ith Node
{
	struct nodeQ *temp;
	struct nodeQ *temp1;
	int j;
	temp = front;


	if(i>Qsize||i<0)
	{
		//why
	}
	else if(i==0)
	{
		front=front->linkQ;
		Qsize--;
	}
	else
	{
		for(j=1;j<i;j++)
		{
			temp = temp->linkQ;
		}

		temp1=temp->linkQ;
		temp->linkQ=temp1->linkQ;

		Qsize--;
	}
}
//////////////////////////////////////////////////////////////////
//Stack

void push(int val,int no)// stack
{
	struct node *temp=(struct node*)malloc(sizeof(struct node));
	//You can also write node *temp=malloc(sizeof(node));

	temp->item = val;
	temp->Quantity = no;
	temp->link = '\0';

	if(top=='\0')
	{
		top = temp;
	}
	else
	{
		temp->link = top;
		top = temp;
	}
}


int pop() //Stack Pop
{
	struct node *temp;

	int val;

	if(top == '\0')
	{
		val=-1;
	}
	else
	{
		val = top->item;
		Quant= top->Quantity;

		temp = top;
		top = top->link;
		//free(temp);
	}

	return val;
}

int peak()
{
	int val;

	if(top == '\0')
	{
		val=-1;
	}
	else
	{
		val = top->item;
	}
	return val;
}

int getMinRotation()//Result Compute
{
	struct nodeQ *temp;
	int Min=5;// min =7
	int x=0;
	int m=0;
	int j;
	temp = front;

	if(temp=='\0')
	{
		Min=0;
	}
	else
	{
		for(j=1;j<Qsize;j++)
		{
			top=temp->Stack;
			m=peak();

			x=m-(temp->CurrentPos);

			if(x<Min)
			{
				Min=x;
			}
			temp = temp->linkQ;
		}

	}
	return Min;
}

void StackPop()
{
	///////////////////////////////////////////////////////////////
	//////////// Variable declaration
	struct nodeQ *temp;
	int INTCount;
	int take;
	int TempPrice;
	int j,i;
	int LEDTemp[5][2];// for temporary storing data
	int **LED;// for taking data;
	int UserCount=0;// For count user who are going to pop
	int MAX_Rotation=0;// maximum time rotation possible
	int Rotation=0;// initial value for rotation
	unsigned char LEDDisplay=0X00;
	char *Str;
	temp = front;
	///////////////////////////////////////////////////////////////
	////////// Fetch Array of product and it's quantity and store in LEDTemp
	for(j=1;j<Qsize;j++)
	{
		top=temp->Stack;

		if(peak()==-1)
		{		
			clear();
			INTCount=0;
			Cursor_Position(1,1);
			LCD_Print("Name:- ");
			Cursor_Position(1,8);
			LCD_Print(temp->Username);
			Cursor_Position(2,1);
			LCD_Print("Bill:- ");
			
			TempPrice=temp->TotalPrice;
			while(TempPrice!=0)
			{
				TempPrice=TempPrice/10;
				INTCount++;
			}
			
			Str = NULL;
			Str=(char *)malloc(INTCount*sizeof(char));
			sprintf(Str,"%d",temp->TotalPrice);
			Cursor_Position(2,8);
			LCD_Print(Str);
			_delay_ms(300);
			Delete(j-1);
		}
		else
		{
			if(temp->CurrentPos==peak())
			{
				take=pop();        //Light the LEDs at "take" Position object no times
				LEDDisplay=LEDDisplay | (1<<take);
				LEDTemp[UserCount][0]=take;
				LEDTemp[UserCount][1]=Quant;

				if(Quant>MAX_Rotation)
				{
					MAX_Rotation=Quant;
				}

				UserCount++;
			}
		}
		temp->Stack=top;
		temp=temp->linkQ;
	}

	///////////////////////////////////////////////////////
	//// Reallocation of Array

	LED=(int**)malloc((UserCount)*sizeof(int*));

	for(i=0;i<UserCount;i++)
	{
		LED[i]=(int*)malloc((2)*sizeof(int));
	}
	////////////////////////////////////////////////////////

	for(i=0;i<UserCount;i++)
	{
		for(j=0;j<2;j++)
		{
			LED[i][j]=LEDTemp[i][j];
		}
	}
	////////////////////////////////////////////////////////
	//// Copy elements from above array to LED
	//free(LEDTemp);// free memory of temporary variable
	//////////////////////////////////////////////
	while(1)
	{
		if(Rotation==MAX_Rotation)
		{
			break;
		}

		PORTA=LEDDisplay;
		_delay_ms(1000);
		PORTA=0X00;
		_delay_ms(1000);
		Rotation++;

		for(i=0;i<UserCount;i++)
		{
			if(LED[i][1]==Rotation)
			{
				LEDDisplay = LEDDisplay ^ (1<<LED[i][0]);
			}
		}
	}
	///////////// End of function
}

int updatePositionTill(int i,int rot)
{
	struct nodeQ *temp;
	int j;
	temp = front;

	if(i>(Qsize-1)||i<1||rot<0)
	{
		return -1;
	}

	for(j=0;j<i;j++)
	{
		temp->CurrentPos=(temp->CurrentPos)+rot;
		temp = temp->linkQ;
	}

	return 1;
}

void stepper_move()	//30 degree
{
	//This should be in sequence means blue pink yellow and orange  

 
	PORTB = 0x0C;
	delay_ms(10);
   
	PORTB = 0x06;
	delay_ms(10);
   
	PORTB = 0x03;
	delay_ms(10);
	
	PORTB = 0x09;
	delay_ms(10);
}

void insertIntoStack(int i,int val,int quanty)
{
	struct nodeQ*temp;

	temp=getElementAddr(i);

	top=temp->Stack;

	push(val,quanty);

	temp->Stack=top;

}

void Bubblesort(int **ar, int size)
{
	int i,j,temp,temp1;

	for(i=0;i<size;i++)
	{
		for(j=0;j<size-1;j++)
		{
			if(ar[j][0]<ar[j+1][0])
			{
				temp=ar[j][0];
				ar[j][0]=ar[j+1][0];
				ar[j+1][0]=temp;

				temp1=ar[j][1];
				ar[j][1]=ar[j+1][1];
				ar[j+1][1]=temp1;
			}
		}
	}
}

void Rotate()
{
	int user=(Qsize-1);
	int rot;
	int i=0;

	while(front!='\0')
	{
		rot=getMinRotation();

		if(rot>=0)
		{
			for(k=0;k<rot;k++)
			{
				stepper_move();
				stepper_move();
				
				delay_ms(500);
			}
			updatePositionTill(user,rot);
		}

		StackPop();

		i++;
		user=Qsize-1;

	}

}

void interrupt(char *Data)
{
	//char Data[] = "shreyas*1/1*2/4*3/2";// this is we are going to get from python code
	int i,j,k;
	int TwoArray[5][2];//for temporary use
	char Name[8];
	char *Fname;
	int pro;int Bill;
	int **NewArray;

	////////////////////////////////////////////////////////////
	//// Fetch User name
	
	
	for(i=0;i<8;i++)
	{
		if(Data[i]=='*')
		{
			break;
		}
		else
		{
			Name[i]=Data[i];
		}
	}
	
	Fname = (char *)malloc((i) * sizeof(char));
	for(k=0;k<i;k++)
	{
		Fname[k]=Name[k];
	}
	//////////////////////////////////////////////////////////
	////////// To calculate bill and to make array useful for sorting
	pro=0;Bill=0;
	for(j=i;Data[j]!='\0';j++)
	{
		if(Data[j]=='*')
		{
			j++;
			TwoArray[pro][0]=Data[j]-'0';// to convert char into int
			j=j+2;
			TwoArray[pro][1]=Data[j]-'0';// to convert char into int
			Bill = Bill + (ProductPrice[TwoArray[pro][0]]*TwoArray[pro][1]);
			pro++;
		}
	}
	////////////////////////// Insert username and bill data into Queue
	insertQ(Qsize,Bill,Fname,i);

	NewArray=(int**)malloc((pro)*sizeof(int*));

	for(i=0;i<pro;i++)
	{
		NewArray[i]=(int*)malloc((2)*sizeof(int));
	}


	for(i=0;i<pro;i++)
	{
		for(j=0;j<2;j++)
		{
			NewArray[i][j]=TwoArray[i][j];
		}
	}

	//////////////////////////Sort the List
	Bubblesort(NewArray,pro);
	////////////////////////// Insert user item into stack
	for(i=0;i<pro;i++)
	{
		insertIntoStack(Qsize-1,NewArray[i][0],NewArray[i][1]);
	}
}

void Interrupt_Initializer()
{
	sei(); // For enable all interrupts
	MCUCR=0X02; // For lower level
	GICR = (1<<INT0);//enable INT0	
}

int main()
{
	//Set-up PORTS for LCD
	DDRC=0xFF;  // For D7-D4 // LCD 
	DDRA=0XFF;  // For A5-A0 // for LED
	DDRD=0XF0;  // D3-D0 for RX and INT0 where as D6 for LCD Enable
	DDRB=0XFF;  // for stepper motor

	front='\0';
	rear='\0';
	top='\0';

	PORTD = 0X00;//Pull down register

	Interrupt_Initializer();
	usart_initialize();
	LCD_Initialize(); //Initialize
	
	while(1)
	{
		Rotate();
	}

	return 0;
}
