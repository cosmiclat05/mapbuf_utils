module if_loop_1_wrapper(
  // inputs
  input [31:0] a_din0,
  input [31:0] a_din1,
  input [31:0] n,
  input  n_valid,
  input  a_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  a_end_ready,
  input  end_ready,
  // outputs
  output  n_ready,
  output  a_start_ready,
  output  start_ready,
  output [31:0] out0,
  output  out0_valid,
  output  a_end_valid,
  output  end_valid,
  output  a_ce0,
  output  a_we0,
  output [31:0] a_address0,
  output [31:0] a_dout0,
  output  a_ce1,
  output  a_we1,
  output [31:0] a_address1,
  output [31:0] a_dout1
);
  wire  mem_to_bram_converter_a_ce0;
  wire  mem_to_bram_converter_a_we0;
  wire [31:0] mem_to_bram_converter_a_address0;
  wire [31:0] mem_to_bram_converter_a_dout0;
  wire  mem_to_bram_converter_a_ce1;
  wire  mem_to_bram_converter_a_we1;
  wire [31:0] mem_to_bram_converter_a_address1;
  wire [31:0] mem_to_bram_converter_a_dout1;
  wire [31:0] mem_to_bram_converter_a_loadData;
  wire [31:0] if_loop_1_wrapped_out0;
  wire if_loop_1_wrapped_out0_valid;
  wire if_loop_1_wrapped_out0_ready;
  wire if_loop_1_wrapped_a_end_valid;
  wire if_loop_1_wrapped_a_end_ready;
  wire if_loop_1_wrapped_end_valid;
  wire if_loop_1_wrapped_end_ready;
  wire  if_loop_1_wrapped_a_loadEn;
  wire [31:0] if_loop_1_wrapped_a_loadAddr;
  wire  if_loop_1_wrapped_a_storeEn;
  wire [31:0] if_loop_1_wrapped_a_storeAddr;
  wire [31:0] if_loop_1_wrapped_a_storeData;

  // module outputs
  assign out0 = if_loop_1_wrapped_out0;
  assign out0_valid = if_loop_1_wrapped_out0_valid;
  assign if_loop_1_wrapped_out0_ready = out0_ready;
  assign a_end_valid = if_loop_1_wrapped_a_end_valid;
  assign if_loop_1_wrapped_a_end_ready = a_end_ready;
  assign end_valid = if_loop_1_wrapped_end_valid;
  assign if_loop_1_wrapped_end_ready = end_ready;
  assign a_ce0 = mem_to_bram_converter_a_ce0;
  assign a_we0 = mem_to_bram_converter_a_we0;
  assign a_address0 = mem_to_bram_converter_a_address0;
  assign a_dout0 = mem_to_bram_converter_a_dout0;
  assign a_ce1 = mem_to_bram_converter_a_ce1;
  assign a_we1 = mem_to_bram_converter_a_we1;
  assign a_address1 = mem_to_bram_converter_a_address1;
  assign a_dout1 = mem_to_bram_converter_a_dout1;

  mem_to_bram #(.DATA_WIDTH(32), .ADDR_WIDTH(32)) mem_to_bram_converter_a(
    .address0 (mem_to_bram_converter_a_address0),
    .address1 (mem_to_bram_converter_a_address1),
    .ce0 (mem_to_bram_converter_a_ce0),
    .ce1 (mem_to_bram_converter_a_ce1),
    .din0 (a_din0),
    .din1 (a_din1),
    .dout0 (mem_to_bram_converter_a_dout0),
    .dout1 (mem_to_bram_converter_a_dout1),
    .loadAddr (if_loop_1_wrapped_a_loadAddr),
    .loadData (mem_to_bram_converter_a_loadData),
    .loadEn (if_loop_1_wrapped_a_loadEn),
    .storeAddr (if_loop_1_wrapped_a_storeAddr),
    .storeData (if_loop_1_wrapped_a_storeData),
    .storeEn (if_loop_1_wrapped_a_storeEn),
    .we0 (mem_to_bram_converter_a_we0),
    .we1 (mem_to_bram_converter_a_we1)
  );

  if_loop_1 if_loop_1_wrapped(
    .a_end_ready (if_loop_1_wrapped_a_end_ready),
    .a_end_valid (if_loop_1_wrapped_a_end_valid),
    .a_loadAddr (if_loop_1_wrapped_a_loadAddr),
    .a_loadData (mem_to_bram_converter_a_loadData),
    .a_loadEn (if_loop_1_wrapped_a_loadEn),
    .a_start_ready (a_start_ready),
    .a_start_valid (a_start_valid),
    .a_storeAddr (if_loop_1_wrapped_a_storeAddr),
    .a_storeData (if_loop_1_wrapped_a_storeData),
    .a_storeEn (if_loop_1_wrapped_a_storeEn),
    .clk (clk),
    .end_ready (if_loop_1_wrapped_end_ready),
    .end_valid (if_loop_1_wrapped_end_valid),
    .n (n),
    .n_ready (n_ready),
    .n_valid (n_valid),
    .out0 (if_loop_1_wrapped_out0),
    .out0_ready (if_loop_1_wrapped_out0_ready),
    .out0_valid (if_loop_1_wrapped_out0_valid),
    .rst (rst),
    .start_ready (start_ready),
    .start_valid (start_valid)
  );

endmodule
