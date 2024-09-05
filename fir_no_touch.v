module fir(
  // inputs
  input [31:0] di_loadData,
  input [31:0] idx_loadData,
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
  output  di_loadEn,
  output [31:0] di_loadAddr,
  output  di_storeEn,
  output [31:0] di_storeAddr,
  output [31:0] di_storeData,
  output  idx_loadEn,
  output [31:0] idx_loadAddr,
  output  idx_storeEn,
  output [31:0] idx_storeAddr,
  output [31:0] idx_storeData
);
  wire fork0_outs_0_valid;
  wire fork0_outs_0_ready;
  wire fork0_outs_1_valid;
  wire fork0_outs_1_ready;
  wire fork0_outs_2_valid;
  wire fork0_outs_2_ready;
  wire [31:0] mem_controller0_ldData_0;
  wire mem_controller0_ldData_0_valid;
  wire mem_controller0_ldData_0_ready;
  wire mem_controller0_memEnd_valid;
  wire mem_controller0_memEnd_ready;
  wire  mem_controller0_loadEn;
  wire [31:0] mem_controller0_loadAddr;
  wire  mem_controller0_storeEn;
  wire [31:0] mem_controller0_storeAddr;
  wire [31:0] mem_controller0_storeData;
  wire [31:0] mem_controller1_ldData_0;
  wire mem_controller1_ldData_0_valid;
  wire mem_controller1_ldData_0_ready;
  wire mem_controller1_memEnd_valid;
  wire mem_controller1_memEnd_ready;
  wire  mem_controller1_loadEn;
  wire [31:0] mem_controller1_loadAddr;
  wire  mem_controller1_storeEn;
  wire [31:0] mem_controller1_storeAddr;
  wire [31:0] mem_controller1_storeData;
  wire [0:0] constant0_outs;
  wire constant0_outs_valid;
  wire constant0_outs_ready;
  wire [0:0] fork1_outs_0;
  wire fork1_outs_0_valid;
  wire fork1_outs_0_ready;
  wire [0:0] fork1_outs_1;
  wire fork1_outs_1_valid;
  wire fork1_outs_1_ready;
  wire [10:0] extsi5_outs;
  wire extsi5_outs_valid;
  wire extsi5_outs_ready;
  wire [31:0] extsi6_outs;
  wire extsi6_outs_valid;
  wire extsi6_outs_ready;
  wire [10:0] buffer0_outs;
  wire buffer0_outs_valid;
  wire buffer0_outs_ready;
  wire [10:0] buffer1_outs;
  wire buffer1_outs_valid;
  wire buffer1_outs_ready;
  wire [10:0] mux2_outs;
  wire mux2_outs_valid;
  wire mux2_outs_ready;
  wire [10:0] fork2_outs_0;
  wire fork2_outs_0_valid;
  wire fork2_outs_0_ready;
  wire [10:0] fork2_outs_1;
  wire fork2_outs_1_valid;
  wire fork2_outs_1_ready;
  wire [10:0] fork2_outs_2;
  wire fork2_outs_2_valid;
  wire fork2_outs_2_ready;
  wire [11:0] extsi7_outs;
  wire extsi7_outs_valid;
  wire extsi7_outs_ready;
  wire [11:0] extsi8_outs;
  wire extsi8_outs_valid;
  wire extsi8_outs_ready;
  wire [31:0] extsi9_outs;
  wire extsi9_outs_valid;
  wire extsi9_outs_ready;
  wire [31:0] buffer2_outs;
  wire buffer2_outs_valid;
  wire buffer2_outs_ready;
  wire [31:0] buffer3_outs;
  wire buffer3_outs_valid;
  wire buffer3_outs_ready;
  wire [31:0] mux1_outs;
  wire mux1_outs_valid;
  wire mux1_outs_ready;
  wire buffer4_outs_valid;
  wire buffer4_outs_ready;
  wire buffer5_outs_valid;
  wire buffer5_outs_ready;
  wire control_merge0_outs_valid;
  wire control_merge0_outs_ready;
  wire [0:0] control_merge0_index;
  wire control_merge0_index_valid;
  wire control_merge0_index_ready;
  wire [0:0] fork3_outs_0;
  wire fork3_outs_0_valid;
  wire fork3_outs_0_ready;
  wire [0:0] fork3_outs_1;
  wire fork3_outs_1_valid;
  wire fork3_outs_1_ready;
  wire source0_outs_valid;
  wire source0_outs_ready;
  wire [10:0] constant1_outs;
  wire constant1_outs_valid;
  wire constant1_outs_ready;
  wire [11:0] extsi10_outs;
  wire extsi10_outs_valid;
  wire extsi10_outs_ready;
  wire source1_outs_valid;
  wire source1_outs_ready;
  wire [10:0] constant4_outs;
  wire constant4_outs_valid;
  wire constant4_outs_ready;
  wire [11:0] extsi11_outs;
  wire extsi11_outs_valid;
  wire extsi11_outs_ready;
  wire source2_outs_valid;
  wire source2_outs_ready;
  wire [1:0] constant8_outs;
  wire constant8_outs_valid;
  wire constant8_outs_ready;
  wire [11:0] extsi12_outs;
  wire extsi12_outs_valid;
  wire extsi12_outs_ready;
  wire [31:0] mc_load0_addrOut;
  wire mc_load0_addrOut_valid;
  wire mc_load0_addrOut_ready;
  wire [31:0] mc_load0_dataOut;
  wire mc_load0_dataOut_valid;
  wire mc_load0_dataOut_ready;
  wire [11:0] subi1_result;
  wire subi1_result_valid;
  wire subi1_result_ready;
  wire [31:0] extsi13_outs;
  wire extsi13_outs_valid;
  wire extsi13_outs_ready;
  wire [31:0] mc_load1_addrOut;
  wire mc_load1_addrOut_valid;
  wire mc_load1_addrOut_ready;
  wire [31:0] mc_load1_dataOut;
  wire mc_load1_dataOut_valid;
  wire mc_load1_dataOut_ready;
  wire [31:0] muli0_result;
  wire muli0_result_valid;
  wire muli0_result_ready;
  wire [31:0] addi0_result;
  wire addi0_result_valid;
  wire addi0_result_ready;
  wire [11:0] addi1_result;
  wire addi1_result_valid;
  wire addi1_result_ready;
  wire [11:0] fork4_outs_0;
  wire fork4_outs_0_valid;
  wire fork4_outs_0_ready;
  wire [11:0] fork4_outs_1;
  wire fork4_outs_1_valid;
  wire fork4_outs_1_ready;
  wire [10:0] trunci0_outs;
  wire trunci0_outs_valid;
  wire trunci0_outs_ready;
  wire [0:0] cmpi1_result;
  wire cmpi1_result_valid;
  wire cmpi1_result_ready;
  wire [0:0] fork5_outs_0;
  wire fork5_outs_0_valid;
  wire fork5_outs_0_ready;
  wire [0:0] fork5_outs_1;
  wire fork5_outs_1_valid;
  wire fork5_outs_1_ready;
  wire [0:0] fork5_outs_2;
  wire fork5_outs_2_valid;
  wire fork5_outs_2_ready;
  wire [10:0] cond_br0_trueOut;
  wire cond_br0_trueOut_valid;
  wire cond_br0_trueOut_ready;
  wire [10:0] cond_br0_falseOut;
  wire cond_br0_falseOut_valid;
  wire cond_br0_falseOut_ready;
  wire [31:0] cond_br2_trueOut;
  wire cond_br2_trueOut_valid;
  wire cond_br2_trueOut_ready;
  wire [31:0] cond_br2_falseOut;
  wire cond_br2_falseOut_valid;
  wire cond_br2_falseOut_ready;
  wire cond_br3_trueOut_valid;
  wire cond_br3_trueOut_ready;
  wire cond_br3_falseOut_valid;
  wire cond_br3_falseOut_ready;
  wire fork6_outs_0_valid;
  wire fork6_outs_0_ready;
  wire fork6_outs_1_valid;
  wire fork6_outs_1_ready;

  // module outputs
  assign out0 = cond_br2_falseOut;
  assign out0_valid = cond_br2_falseOut_valid;
  assign cond_br2_falseOut_ready = out0_ready;
  assign di_end_valid = mem_controller1_memEnd_valid;
  assign mem_controller1_memEnd_ready = di_end_ready;
  assign idx_end_valid = mem_controller0_memEnd_valid;
  assign mem_controller0_memEnd_ready = idx_end_ready;
  assign end_valid = fork0_outs_1_valid;
  assign fork0_outs_1_ready = end_ready;
  assign di_loadEn = mem_controller1_loadEn;
  assign di_loadAddr = mem_controller1_loadAddr;
  assign di_storeEn = mem_controller1_storeEn;
  assign di_storeAddr = mem_controller1_storeAddr;
  assign di_storeData = mem_controller1_storeData;
  assign idx_loadEn = mem_controller0_loadEn;
  assign idx_loadAddr = mem_controller0_loadAddr;
  assign idx_storeEn = mem_controller0_storeEn;
  assign idx_storeAddr = mem_controller0_storeAddr;
  assign idx_storeData = mem_controller0_storeData;

  fork_dataless #(.SIZE(3)) fork0(
    .clk (clk),
    .ins_ready (start_ready),
    .ins_valid (start_valid),
    .outs_ready ({fork0_outs_2_ready, fork0_outs_1_ready, fork0_outs_0_ready}),
    .outs_valid ({fork0_outs_2_valid, fork0_outs_1_valid, fork0_outs_0_valid}),
    .rst (rst)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(32), .ADDR_TYPE(32)) mem_controller0(
    .clk (clk),
    .ctrlEnd_ready (fork6_outs_0_ready),
    .ctrlEnd_valid (fork6_outs_0_valid),
    .ldAddr ({mc_load0_addrOut}),
    .ldAddr_ready ({mc_load0_addrOut_ready}),
    .ldAddr_valid ({mc_load0_addrOut_valid}),
    .ldData ({mem_controller0_ldData_0}),
    .ldData_ready ({mem_controller0_ldData_0_ready}),
    .ldData_valid ({mem_controller0_ldData_0_valid}),
    .loadAddr (mem_controller0_loadAddr),
    .loadData (idx_loadData),
    .loadEn (mem_controller0_loadEn),
    .memEnd_ready (mem_controller0_memEnd_ready),
    .memEnd_valid (mem_controller0_memEnd_valid),
    .memStart_ready (idx_start_ready),
    .memStart_valid (idx_start_valid),
    .rst (rst),
    .storeAddr (mem_controller0_storeAddr),
    .storeData (mem_controller0_storeData),
    .storeEn (mem_controller0_storeEn)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(32), .ADDR_TYPE(32)) mem_controller1(
    .clk (clk),
    .ctrlEnd_ready (fork6_outs_1_ready),
    .ctrlEnd_valid (fork6_outs_1_valid),
    .ldAddr ({mc_load1_addrOut}),
    .ldAddr_ready ({mc_load1_addrOut_ready}),
    .ldAddr_valid ({mc_load1_addrOut_valid}),
    .ldData ({mem_controller1_ldData_0}),
    .ldData_ready ({mem_controller1_ldData_0_ready}),
    .ldData_valid ({mem_controller1_ldData_0_valid}),
    .loadAddr (mem_controller1_loadAddr),
    .loadData (di_loadData),
    .loadEn (mem_controller1_loadEn),
    .memEnd_ready (mem_controller1_memEnd_ready),
    .memEnd_valid (mem_controller1_memEnd_valid),
    .memStart_ready (di_start_ready),
    .memStart_valid (di_start_valid),
    .rst (rst),
    .storeAddr (mem_controller1_storeAddr),
    .storeData (mem_controller1_storeData),
    .storeEn (mem_controller1_storeEn)
  );

  handshake_constant_0 #(.DATA_WIDTH(1)) constant0(
    .clk (clk),
    .ctrl_ready (fork0_outs_0_ready),
    .ctrl_valid (fork0_outs_0_valid),
    .outs (constant0_outs),
    .outs_ready (constant0_outs_ready),
    .outs_valid (constant0_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork1(
    .clk (clk),
    .ins (constant0_outs),
    .ins_ready (constant0_outs_ready),
    .ins_valid (constant0_outs_valid),
    .outs ({fork1_outs_1, fork1_outs_0}),
    .outs_ready ({fork1_outs_1_ready, fork1_outs_0_ready}),
    .outs_valid ({fork1_outs_1_valid, fork1_outs_0_valid}),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(11)) extsi5(
    .clk (clk),
    .ins (fork1_outs_0),
    .ins_ready (fork1_outs_0_ready),
    .ins_valid (fork1_outs_0_valid),
    .outs (extsi5_outs),
    .outs_ready (extsi5_outs_ready),
    .outs_valid (extsi5_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(32)) extsi6(
    .clk (clk),
    .ins (fork1_outs_1),
    .ins_ready (fork1_outs_1_ready),
    .ins_valid (fork1_outs_1_valid),
    .outs (extsi6_outs),
    .outs_ready (extsi6_outs_ready),
    .outs_valid (extsi6_outs_valid),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(11)) buffer0(
    .clk (clk),
    .ins (cond_br0_trueOut),
    .ins_ready (cond_br0_trueOut_ready),
    .ins_valid (cond_br0_trueOut_valid),
    .outs (buffer0_outs),
    .outs_ready (buffer0_outs_ready),
    .outs_valid (buffer0_outs_valid),
    .rst (rst)
  );

  tehb #(.DATA_TYPE(11)) buffer1(
    .clk (clk),
    .ins (buffer0_outs),
    .ins_ready (buffer0_outs_ready),
    .ins_valid (buffer0_outs_valid),
    .outs (buffer1_outs),
    .outs_ready (buffer1_outs_ready),
    .outs_valid (buffer1_outs_valid),
    .rst (rst)
  );

  mux #(.SIZE(2), .DATA_TYPE(11), .SELECT_TYPE(1)) mux2(
    .clk (clk),
    .index (fork3_outs_0),
    .index_ready (fork3_outs_0_ready),
    .index_valid (fork3_outs_0_valid),
    .ins ({buffer1_outs, extsi5_outs}),
    .ins_ready ({buffer1_outs_ready, extsi5_outs_ready}),
    .ins_valid ({buffer1_outs_valid, extsi5_outs_valid}),
    .outs (mux2_outs),
    .outs_ready (mux2_outs_ready),
    .outs_valid (mux2_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(11)) fork2(
    .clk (clk),
    .ins (mux2_outs),
    .ins_ready (mux2_outs_ready),
    .ins_valid (mux2_outs_valid),
    .outs ({fork2_outs_2, fork2_outs_1, fork2_outs_0}),
    .outs_ready ({fork2_outs_2_ready, fork2_outs_1_ready, fork2_outs_0_ready}),
    .outs_valid ({fork2_outs_2_valid, fork2_outs_1_valid, fork2_outs_0_valid}),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi7(
    .clk (clk),
    .ins (fork2_outs_0),
    .ins_ready (fork2_outs_0_ready),
    .ins_valid (fork2_outs_0_valid),
    .outs (extsi7_outs),
    .outs_ready (extsi7_outs_ready),
    .outs_valid (extsi7_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi8(
    .clk (clk),
    .ins (fork2_outs_1),
    .ins_ready (fork2_outs_1_ready),
    .ins_valid (fork2_outs_1_valid),
    .outs (extsi8_outs),
    .outs_ready (extsi8_outs_ready),
    .outs_valid (extsi8_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(32)) extsi9(
    .clk (clk),
    .ins (fork2_outs_2),
    .ins_ready (fork2_outs_2_ready),
    .ins_valid (fork2_outs_2_valid),
    .outs (extsi9_outs),
    .outs_ready (extsi9_outs_ready),
    .outs_valid (extsi9_outs_valid),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(32)) buffer2(
    .clk (clk),
    .ins (cond_br2_trueOut),
    .ins_ready (cond_br2_trueOut_ready),
    .ins_valid (cond_br2_trueOut_valid),
    .outs (buffer2_outs),
    .outs_ready (buffer2_outs_ready),
    .outs_valid (buffer2_outs_valid),
    .rst (rst)
  );

  tehb #(.DATA_TYPE(32)) buffer3(
    .clk (clk),
    .ins (buffer2_outs),
    .ins_ready (buffer2_outs_ready),
    .ins_valid (buffer2_outs_valid),
    .outs (buffer3_outs),
    .outs_ready (buffer3_outs_ready),
    .outs_valid (buffer3_outs_valid),
    .rst (rst)
  );

  mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux1(
    .clk (clk),
    .index (fork3_outs_1),
    .index_ready (fork3_outs_1_ready),
    .index_valid (fork3_outs_1_valid),
    .ins ({buffer3_outs, extsi6_outs}),
    .ins_ready ({buffer3_outs_ready, extsi6_outs_ready}),
    .ins_valid ({buffer3_outs_valid, extsi6_outs_valid}),
    .outs (mux1_outs),
    .outs_ready (mux1_outs_ready),
    .outs_valid (mux1_outs_valid),
    .rst (rst)
  );

  oehb_dataless buffer4(
    .clk (clk),
    .ins_ready (cond_br3_trueOut_ready),
    .ins_valid (cond_br3_trueOut_valid),
    .outs_ready (buffer4_outs_ready),
    .outs_valid (buffer4_outs_valid),
    .rst (rst)
  );

  tehb_dataless buffer5(
    .clk (clk),
    .ins_ready (buffer4_outs_ready),
    .ins_valid (buffer4_outs_valid),
    .outs_ready (buffer5_outs_ready),
    .outs_valid (buffer5_outs_valid),
    .rst (rst)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
    .clk (clk),
    .index (control_merge0_index),
    .index_ready (control_merge0_index_ready),
    .index_valid (control_merge0_index_valid),
    .ins_ready ({buffer5_outs_ready, fork0_outs_2_ready}),
    .ins_valid ({buffer5_outs_valid, fork0_outs_2_valid}),
    .outs_ready (control_merge0_outs_ready),
    .outs_valid (control_merge0_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(1)) fork3(
    .clk (clk),
    .ins (control_merge0_index),
    .ins_ready (control_merge0_index_ready),
    .ins_valid (control_merge0_index_valid),
    .outs ({fork3_outs_1, fork3_outs_0}),
    .outs_ready ({fork3_outs_1_ready, fork3_outs_0_ready}),
    .outs_valid ({fork3_outs_1_valid, fork3_outs_0_valid}),
    .rst (rst)
  );

  source source0(
    .clk (clk),
    .outs_ready (source0_outs_ready),
    .outs_valid (source0_outs_valid),
    .rst (rst)
  );

  handshake_constant_1 #(.DATA_WIDTH(11)) constant1(
    .clk (clk),
    .ctrl_ready (source0_outs_ready),
    .ctrl_valid (source0_outs_valid),
    .outs (constant1_outs),
    .outs_ready (constant1_outs_ready),
    .outs_valid (constant1_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi10(
    .clk (clk),
    .ins (constant1_outs),
    .ins_ready (constant1_outs_ready),
    .ins_valid (constant1_outs_valid),
    .outs (extsi10_outs),
    .outs_ready (extsi10_outs_ready),
    .outs_valid (extsi10_outs_valid),
    .rst (rst)
  );

  source source1(
    .clk (clk),
    .outs_ready (source1_outs_ready),
    .outs_valid (source1_outs_valid),
    .rst (rst)
  );

  handshake_constant_2 #(.DATA_WIDTH(11)) constant4(
    .clk (clk),
    .ctrl_ready (source1_outs_ready),
    .ctrl_valid (source1_outs_valid),
    .outs (constant4_outs),
    .outs_ready (constant4_outs_ready),
    .outs_valid (constant4_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi11(
    .clk (clk),
    .ins (constant4_outs),
    .ins_ready (constant4_outs_ready),
    .ins_valid (constant4_outs_valid),
    .outs (extsi11_outs),
    .outs_ready (extsi11_outs_ready),
    .outs_valid (extsi11_outs_valid),
    .rst (rst)
  );

  source source2(
    .clk (clk),
    .outs_ready (source2_outs_ready),
    .outs_valid (source2_outs_valid),
    .rst (rst)
  );

  handshake_constant_3 #(.DATA_WIDTH(2)) constant8(
    .clk (clk),
    .ctrl_ready (source2_outs_ready),
    .ctrl_valid (source2_outs_valid),
    .outs (constant8_outs),
    .outs_ready (constant8_outs_ready),
    .outs_valid (constant8_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(12)) extsi12(
    .clk (clk),
    .ins (constant8_outs),
    .ins_ready (constant8_outs_ready),
    .ins_valid (constant8_outs_valid),
    .outs (extsi12_outs),
    .outs_ready (extsi12_outs_ready),
    .outs_valid (extsi12_outs_valid),
    .rst (rst)
  );

  mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load0(
    .addrIn (extsi9_outs),
    .addrIn_ready (extsi9_outs_ready),
    .addrIn_valid (extsi9_outs_valid),
    .addrOut (mc_load0_addrOut),
    .addrOut_ready (mc_load0_addrOut_ready),
    .addrOut_valid (mc_load0_addrOut_valid),
    .clk (clk),
    .dataFromMem (mem_controller0_ldData_0),
    .dataFromMem_ready (mem_controller0_ldData_0_ready),
    .dataFromMem_valid (mem_controller0_ldData_0_valid),
    .dataOut (mc_load0_dataOut),
    .dataOut_ready (mc_load0_dataOut_ready),
    .dataOut_valid (mc_load0_dataOut_valid),
    .rst (rst)
  );

  subi #(.DATA_TYPE(12)) subi1(
    .clk (clk),
    .lhs (extsi10_outs),
    .lhs_ready (extsi10_outs_ready),
    .lhs_valid (extsi10_outs_valid),
    .result (subi1_result),
    .result_ready (subi1_result_ready),
    .result_valid (subi1_result_valid),
    .rhs (extsi8_outs),
    .rhs_ready (extsi8_outs_ready),
    .rhs_valid (extsi8_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(12), .OUTPUT_TYPE(32)) extsi13(
    .clk (clk),
    .ins (subi1_result),
    .ins_ready (subi1_result_ready),
    .ins_valid (subi1_result_valid),
    .outs (extsi13_outs),
    .outs_ready (extsi13_outs_ready),
    .outs_valid (extsi13_outs_valid),
    .rst (rst)
  );

  mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load1(
    .addrIn (extsi13_outs),
    .addrIn_ready (extsi13_outs_ready),
    .addrIn_valid (extsi13_outs_valid),
    .addrOut (mc_load1_addrOut),
    .addrOut_ready (mc_load1_addrOut_ready),
    .addrOut_valid (mc_load1_addrOut_valid),
    .clk (clk),
    .dataFromMem (mem_controller1_ldData_0),
    .dataFromMem_ready (mem_controller1_ldData_0_ready),
    .dataFromMem_valid (mem_controller1_ldData_0_valid),
    .dataOut (mc_load1_dataOut),
    .dataOut_ready (mc_load1_dataOut_ready),
    .dataOut_valid (mc_load1_dataOut_valid),
    .rst (rst)
  );

  muli #(.DATA_TYPE(32)) muli0(
    .clk (clk),
    .lhs (mc_load0_dataOut),
    .lhs_ready (mc_load0_dataOut_ready),
    .lhs_valid (mc_load0_dataOut_valid),
    .result (muli0_result),
    .result_ready (muli0_result_ready),
    .result_valid (muli0_result_valid),
    .rhs (mc_load1_dataOut),
    .rhs_ready (mc_load1_dataOut_ready),
    .rhs_valid (mc_load1_dataOut_valid),
    .rst (rst)
  );

  addi #(.DATA_TYPE(32)) addi0(
    .clk (clk),
    .lhs (mux1_outs),
    .lhs_ready (mux1_outs_ready),
    .lhs_valid (mux1_outs_valid),
    .result (addi0_result),
    .result_ready (addi0_result_ready),
    .result_valid (addi0_result_valid),
    .rhs (muli0_result),
    .rhs_ready (muli0_result_ready),
    .rhs_valid (muli0_result_valid),
    .rst (rst)
  );

  addi #(.DATA_TYPE(12)) addi1(
    .clk (clk),
    .lhs (extsi7_outs),
    .lhs_ready (extsi7_outs_ready),
    .lhs_valid (extsi7_outs_valid),
    .result (addi1_result),
    .result_ready (addi1_result_ready),
    .result_valid (addi1_result_valid),
    .rhs (extsi12_outs),
    .rhs_ready (extsi12_outs_ready),
    .rhs_valid (extsi12_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(12)) fork4(
    .clk (clk),
    .ins (addi1_result),
    .ins_ready (addi1_result_ready),
    .ins_valid (addi1_result_valid),
    .outs ({fork4_outs_1, fork4_outs_0}),
    .outs_ready ({fork4_outs_1_ready, fork4_outs_0_ready}),
    .outs_valid ({fork4_outs_1_valid, fork4_outs_0_valid}),
    .rst (rst)
  );

  trunci #(.INPUT_TYPE(12), .OUTPUT_TYPE(11)) trunci0(
    .clk (clk),
    .ins (fork4_outs_0),
    .ins_ready (fork4_outs_0_ready),
    .ins_valid (fork4_outs_0_valid),
    .outs (trunci0_outs),
    .outs_ready (trunci0_outs_ready),
    .outs_valid (trunci0_outs_valid),
    .rst (rst)
  );

  handshake_cmpi_0 #(.DATA_TYPE(12)) cmpi1(
    .clk (clk),
    .lhs (fork4_outs_1),
    .lhs_ready (fork4_outs_1_ready),
    .lhs_valid (fork4_outs_1_valid),
    .result (cmpi1_result),
    .result_ready (cmpi1_result_ready),
    .result_valid (cmpi1_result_valid),
    .rhs (extsi11_outs),
    .rhs_ready (extsi11_outs_ready),
    .rhs_valid (extsi11_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork5(
    .clk (clk),
    .ins (cmpi1_result),
    .ins_ready (cmpi1_result_ready),
    .ins_valid (cmpi1_result_valid),
    .outs ({fork5_outs_2, fork5_outs_1, fork5_outs_0}),
    .outs_ready ({fork5_outs_2_ready, fork5_outs_1_ready, fork5_outs_0_ready}),
    .outs_valid ({fork5_outs_2_valid, fork5_outs_1_valid, fork5_outs_0_valid}),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(11)) cond_br0(
    .clk (clk),
    .condition (fork5_outs_0),
    .condition_ready (fork5_outs_0_ready),
    .condition_valid (fork5_outs_0_valid),
    .data (trunci0_outs),
    .data_ready (trunci0_outs_ready),
    .data_valid (trunci0_outs_valid),
    .falseOut (cond_br0_falseOut),
    .falseOut_ready (cond_br0_falseOut_ready),
    .falseOut_valid (cond_br0_falseOut_valid),
    .rst (rst),
    .trueOut (cond_br0_trueOut),
    .trueOut_ready (cond_br0_trueOut_ready),
    .trueOut_valid (cond_br0_trueOut_valid)
  );

  sink #(.DATA_TYPE(11)) sink0(
    .clk (clk),
    .ins (cond_br0_falseOut),
    .ins_ready (cond_br0_falseOut_ready),
    .ins_valid (cond_br0_falseOut_valid),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br2(
    .clk (clk),
    .condition (fork5_outs_1),
    .condition_ready (fork5_outs_1_ready),
    .condition_valid (fork5_outs_1_valid),
    .data (addi0_result),
    .data_ready (addi0_result_ready),
    .data_valid (addi0_result_valid),
    .falseOut (cond_br2_falseOut),
    .falseOut_ready (cond_br2_falseOut_ready),
    .falseOut_valid (cond_br2_falseOut_valid),
    .rst (rst),
    .trueOut (cond_br2_trueOut),
    .trueOut_ready (cond_br2_trueOut_ready),
    .trueOut_valid (cond_br2_trueOut_valid)
  );

  cond_br_dataless cond_br3(
    .clk (clk),
    .condition (fork5_outs_2),
    .condition_ready (fork5_outs_2_ready),
    .condition_valid (fork5_outs_2_valid),
    .data_ready (control_merge0_outs_ready),
    .data_valid (control_merge0_outs_valid),
    .falseOut_ready (cond_br3_falseOut_ready),
    .falseOut_valid (cond_br3_falseOut_valid),
    .rst (rst),
    .trueOut_ready (cond_br3_trueOut_ready),
    .trueOut_valid (cond_br3_trueOut_valid)
  );

  fork_dataless #(.SIZE(2)) fork6(
    .clk (clk),
    .ins_ready (cond_br3_falseOut_ready),
    .ins_valid (cond_br3_falseOut_valid),
    .outs_ready ({fork6_outs_1_ready, fork6_outs_0_ready}),
    .outs_valid ({fork6_outs_1_valid, fork6_outs_0_valid}),
    .rst (rst)
  );

endmodule
