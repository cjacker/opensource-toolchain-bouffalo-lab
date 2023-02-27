// Blink 1 LED connect to GPIO 1 of XT-BL12 devboards

#include "bflb_gpio.h"
#include "board.h"

struct bflb_device_s *gpio;

int main(void)
{
    board_init();

    gpio = bflb_device_get_by_name("gpio");
    printf("gpio output\r\n");
    bflb_gpio_init(gpio, GPIO_PIN_1, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);

    while (1) {
        bflb_gpio_set(gpio, GPIO_PIN_1);
        bflb_mtimer_delay_ms(100);
        bflb_gpio_reset(gpio, GPIO_PIN_1);
        bflb_mtimer_delay_ms(100);
    }
}
