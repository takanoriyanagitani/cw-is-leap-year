#include <stdint.h>
#include <stdbool.h>

int32_t isleap(uint16_t y1_9999){
  bool chk4 = 0 == (y1_9999 & 3);
  bool chk100 = 0 != (y1_9999 % 100);
  bool chk400 = 0 == (y1_9999 % 400);

  bool is_leap = chk4 && (chk100 || chk400);
  return is_leap ? 1 : 0;
}
