module fir_wrapper(
  // inputs
  input [31:0] di_din0,
  input [31:0] di_din1,
  input [31:0] idx_din0,
  input [31:0] idx_din1,
  input  di_start_valid,
  input  idx_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  di_end_ready,
  input  idx_end_ready,
  input  end_ready,
  // outputs
  output  di_start_ready,
  output  idx_start_ready,
  output  start_ready,
  output [31:0] out0,
  output  out0_valid,
  output  di_end_valid,
  output  idx_end_valid,
  output  end_valid,
  output  di_ce0,
  output  di_we0,
  output [31:0] di_address0,
  output [31:0] di_dout0,
  output  di_ce1,
  output  di_we1,
  output [31:0] di_address1,
  output [31:0] di_dout1,
  output  idx_ce0,
  output  idx_we0,
  output [31:0] idx_address0,
  output [31:0] idx_dout0,
  output  idx_ce1,
  output  idx_we1,
  output [31:0] idx_address1,
  output [31:0] idx_dout1
);
  wire  mem_to_bram_converter_di_ce0;
  wire  mem_to_bram_converter_di_we0;
  wire [31:0] mem_to_bram_converter_di_address0;
  wire [31:0] mem_to_bram_converter_di_dout0;
  wire  mem_to_bram_converter_di_ce1;
  wire  mem_to_bram_converter_di_we1;
  wire [31:0] mem_to_bram_converter_di_address1;
  wire [31:0] mem_to_bram_converter_di_dout1;
  wire [31:0] mem_to_bram_converter_di_loadData;
  wire  mem_to_bram_converter_idx_ce0;
  wire  mem_to_bram_converter_idx_we0;
  wire [31:0] mem_to_bram_converter_idx_address0;
  wire [31:0] mem_to_bram_converter_idx_dout0;
  wire  mem_to_bram_converter_idx_ce1;
  wire  mem_to_bram_converter_idx_we1;
  wire [31:0] mem_to_bram_converter_idx_address1;
  wire [31:0] mem_to_bram_converter_idx_dout1;
  wire [31:0] mem_to_bram_converter_idx_loadData;
  wire [31:0] fir_wrapped_out0;
  wire fir_wrapped_out0_valid;
  wire fir_wrapped_out0_ready;
  wire fir_wrapped_di_end_valid;
  wire fir_wrapped_di_end_ready;
  wire fir_wrapped_idx_end_valid;
  wire fir_wrapped_idx_end_ready;
  wire fir_wrapped_end_valid;
  wire fir_wrapped_end_ready;
  wire  fir_wrapped_di_loadEn;
  wire [31:0] fir_wrapped_di_loadAddr;
  wire  fir_wrapped_di_storeEn;
  wire [31:0] fir_wrapped_di_storeAddr;
  wire [31:0] fir_wrapped_di_storeData;
  wire  fir_wrapped_idx_loadEn;
  wire [31:0] fir_wrapped_idx_loadAddr;
  wire  fir_wrapped_idx_storeEn;
  wire [31:0] fir_wrapped_idx_storeAddr;
  wire [31:0] fir_wrapped_idx_storeData;

  // module outputs
  assign out0 = fir_wrapped_out0;
  assign out0_valid = fir_wrapped_out0_valid;
  assign fir_wrapped_out0_ready = out0_ready;
  assign di_end_valid = fir_wrapped_di_end_valid;
  assign fir_wrapped_di_end_ready = di_end_ready;
  assign idx_end_valid = fir_wrapped_idx_end_valid;
  assign fir_wrapped_idx_end_ready = idx_end_ready;
  assign end_valid = fir_wrapped_end_valid;
  assign fir_wrapped_end_ready = end_ready;
  assign di_ce0 = mem_to_bram_converter_di_ce0;
  assign di_we0 = mem_to_bram_converter_di_we0;
  assign di_address0 = mem_to_bram_converter_di_address0;
  assign di_dout0 = mem_to_bram_converter_di_dout0;
  assign di_ce1 = mem_to_bram_converter_di_ce1;
  assign di_we1 = mem_to_bram_converter_di_we1;
  assign di_address1 = mem_to_bram_converter_di_address1;
  assign di_dout1 = mem_to_bram_converter_di_dout1;
  assign idx_ce0 = mem_to_bram_converter_idx_ce0;
  assign idx_we0 = mem_to_bram_converter_idx_we0;
  assign idx_address0 = mem_to_bram_converter_idx_address0;
  assign idx_dout0 = mem_to_bram_converter_idx_dout0;
  assign idx_ce1 = mem_to_bram_converter_idx_ce1;
  assign idx_we1 = mem_to_bram_converter_idx_we1;
  assign idx_address1 = mem_to_bram_converter_idx_address1;
  assign idx_dout1 = mem_to_bram_converter_idx_dout1;

  mem_to_bram #(.DATA_WIDTH(32), .ADDR_WIDTH(32)) mem_to_bram_converter_di(
    .address0 (mem_to_bram_converter_di_address0),
    .address1 (mem_to_bram_converter_di_address1),
    .ce0 (mem_to_bram_converter_di_ce0),
    .ce1 (mem_to_bram_converter_di_ce1),
    .din0 (di_din0),
    .din1 (di_din1),
    .dout0 (mem_to_bram_converter_di_dout0),
    .dout1 (mem_to_bram_converter_di_dout1),
    .loadAddr (fir_wrapped_di_loadAddr),
    .loadData (mem_to_bram_converter_di_loadData),
    .loadEn (fir_wrapped_di_loadEn),
    .storeAddr (fir_wrapped_di_storeAddr),
    .storeData (fir_wrapped_di_storeData),
    .storeEn (fir_wrapped_di_storeEn),
    .we0 (mem_to_bram_converter_di_we0),
    .we1 (mem_to_bram_converter_di_we1)
  );

  mem_to_bram #(.DATA_WIDTH(32), .ADDR_WIDTH(32)) mem_to_bram_converter_idx(
    .address0 (mem_to_bram_converter_idx_address0),
    .address1 (mem_to_bram_converter_idx_address1),
    .ce0 (mem_to_bram_converter_idx_ce0),
    .ce1 (mem_to_bram_converter_idx_ce1),
    .din0 (idx_din0),
    .din1 (idx_din1),
    .dout0 (mem_to_bram_converter_idx_dout0),
    .dout1 (mem_to_bram_converter_idx_dout1),
    .loadAddr (fir_wrapped_idx_loadAddr),
    .loadData (mem_to_bram_converter_idx_loadData),
    .loadEn (fir_wrapped_idx_loadEn),
    .storeAddr (fir_wrapped_idx_storeAddr),
    .storeData (fir_wrapped_idx_storeData),
    .storeEn (fir_wrapped_idx_storeEn),
    .we0 (mem_to_bram_converter_idx_we0),
    .we1 (mem_to_bram_converter_idx_we1)
  );

  fir fir_wrapped(
    .clk (clk),
    .di_end_ready (fir_wrapped_di_end_ready),
    .di_end_valid (fir_wrapped_di_end_valid),
    .di_loadAddr (fir_wrapped_di_loadAddr),
    .di_loadData (mem_to_bram_converter_di_loadData),
    .di_loadEn (fir_wrapped_di_loadEn),
    .di_start_ready (di_start_ready),
    .di_start_valid (di_start_valid),
    .di_storeAddr (fir_wrapped_di_storeAddr),
    .di_storeData (fir_wrapped_di_storeData),
    .di_storeEn (fir_wrapped_di_storeEn),
    .end_ready (fir_wrapped_end_ready),
    .end_valid (fir_wrapped_end_valid),
    .idx_end_ready (fir_wrapped_idx_end_ready),
    .idx_end_valid (fir_wrapped_idx_end_valid),
    .idx_loadAddr (fir_wrapped_idx_loadAddr),
    .idx_loadData (mem_to_bram_converter_idx_loadData),
    .idx_loadEn (fir_wrapped_idx_loadEn),
    .idx_start_ready (idx_start_ready),
    .idx_start_valid (idx_start_valid),
    .idx_storeAddr (fir_wrapped_idx_storeAddr),
    .idx_storeData (fir_wrapped_idx_storeData),
    .idx_storeEn (fir_wrapped_idx_storeEn),
    .out0 (fir_wrapped_out0),
    .out0_ready (fir_wrapped_out0_ready),
    .out0_valid (fir_wrapped_out0_valid),
    .rst (rst),
    .start_ready (start_ready),
    .start_valid (start_valid)
  );

endmodule
