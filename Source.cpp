#include <tchar.h>
#include <iostream>


extern "C" int MulDiv(int a, int b, int* prod, int* quo, int* rem);

int _tmain(int argc, _TCHAR* argv[])
{
	int a = 21, b = 9;
	int cd = a / b;

	int prod = 0, quo = 0, rem = 0;
	std::cout << "a =" << a << " b = " << b << std::endl;
 	std::cout << "Console Divide Result = " << cd << std::endl;
	std::cout << "Console Multiplication Result = " << a * b << std::endl;
	
 
	int ar;

	ar = MulDiv(a, b, &prod, &quo, &rem);



	std::cout << "Assembly Result = " << ar << std::endl;
	std::cout << prod << " " << quo << " " << rem << std::endl;
	return 0;
}