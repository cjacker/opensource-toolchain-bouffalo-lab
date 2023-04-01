// Blink 2 LEDs of M0S Dock connect to GPIO 27 and 28
// Blink 1 LED of M0P Dock connect to GPIO 21
#include "bflb_gpio.h"
#include "board.h"

struct bflb_device_s *gpio;

int main(void)
{
    board_init();

    gpio = bflb_device_get_by_name("gpio");
    printf("gpio output\r\n");
    bflb_gpio_init(gpio, GPIO_PIN_27, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
    bflb_gpio_init(gpio, GPIO_PIN_28, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
    // for Sipeed M0P (bl618)
    bflb_gpio_init(gpio, GPIO_PIN_21, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);

    while (1) {
        bflb_gpio_set(gpio, GPIO_PIN_27);
        bflb_gpio_reset(gpio, GPIO_PIN_28);

        // for Sipeed M0P (bl618)
        bflb_gpio_set(gpio, GPIO_PIN_21);

        bflb_mtimer_delay_ms(100);

        bflb_gpio_reset(gpio, GPIO_PIN_27);
        bflb_gpio_set(gpio, GPIO_PIN_28);

        // for Sipeed M0P (bl618)
        bflb_gpio_reset(gpio, GPIO_PIN_21);

        bflb_mtimer_delay_ms(100);
    }
}
