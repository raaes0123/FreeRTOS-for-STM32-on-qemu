/* FreeRTOS includes. */
#include <stddef.h>
#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>
#include <timers.h>
#include <semphr.h>

/* Standard includes. */
//#include <stdio.h>


void *memset(void *s, int c, size_t n) {
    unsigned char *ptr = s;
    while (n--) {
        *ptr++ = (unsigned char)c;
    }
    return s;
}

void *memcpy(void *d, void *s, size_t n) {
    unsigned char *sptr = s;
    unsigned char *dptr = d;
    while (n--) {
        *dptr++ = *sptr++;
    }
    return d;
}

void vTask1(void *pvParameters)
{
    while (1)
    {
        // Do something
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void vTask2(void *pvParameters)
{
    while (1)
    {
        // Do something
        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}

void vApplicationTickHook(void){

}

void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName)
{
    // This function is called if a stack overflow is detected.
    // You can log, halt the system, blink an LED, etc.
    //printf("Stack overflow in task: %s\n", pcTaskName);
    //taskDISABLE_INTERRUPTS();
    for (;;);  // Stay here to halt the system
}


void vApplicationMallocFailedHook(void){

}

void main(void)
{
    // Your peripheral initialization here if any

    xTaskCreate(vTask1, "Task1", 128, NULL, 1, NULL);
    xTaskCreate(vTask2, "Task2", 128, NULL, 1, NULL);
    vTaskStartScheduler();

    while(1); // Should never reach here
}
