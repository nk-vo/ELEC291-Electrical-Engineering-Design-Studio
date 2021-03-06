// Connect LED+resistor to PB0 (pin 14)
#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
	DDRB |= 0x01;
	PORTB |= 0x01;
	
	while(1) 
	{
		PORTB &= (~0x01);
		_delay_ms(500);
		PORTB |= 0x01;
		_delay_ms(500);
	}
	return 0;
}
