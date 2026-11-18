// Dibuat otomatis oleh notebook training. Jangan diedit manual.
localparam integer IMG_SIZE    = 32;
localparam integer NUM_CLASSES = 6;      // indeks 0..5 = angka dadu 1..6
localparam integer MARGIN_THRESH = 20943;   // top1-top2 (INT32) < nilai ini => lempar ulang
localparam integer CONV1_IN_CH = 1;
localparam integer CONV1_OUT_CH = 8;
localparam integer CONV1_K = 3;
localparam integer CONV1_MULT = 40577;
localparam integer CONV1_SHIFT = 24;
localparam integer CONV2_IN_CH = 8;
localparam integer CONV2_OUT_CH = 16;
localparam integer CONV2_K = 3;
localparam integer CONV2_MULT = 51433;
localparam integer CONV2_SHIFT = 23;
localparam integer CONV3_IN_CH = 16;
localparam integer CONV3_OUT_CH = 32;
localparam integer CONV3_K = 3;
localparam integer CONV3_MULT = 51437;
localparam integer CONV3_SHIFT = 25;
localparam integer DENSE_IN = 512;
localparam integer DENSE_OUT = 6;
