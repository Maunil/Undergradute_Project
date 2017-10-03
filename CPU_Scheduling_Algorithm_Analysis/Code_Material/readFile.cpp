#include <iostream>
#include <fstream>
 
 using namespace std;

 int main()
 {
 	ifstream infile("10.txt");

 	int a,e,d;
 	while(infile >> a >> e >> d)
 	{
 		cout<<" "<<a<<" "<<e<<" "<<d<<endl;
 	}

	return 0;
 }