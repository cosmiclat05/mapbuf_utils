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
  input  fork0_outs_0_valid__anchors_in,
  input  fork0_outs_0_ready__anchors_in,
  input  fork0_outs_1_valid__anchors_in,
  input  fork0_outs_1_ready__anchors_in,
  input  fork0_outs_2_valid__anchors_in,
  input  fork0_outs_2_ready__anchors_in,
  input [31:0] mem_controller0_ldData_0__data_anchors_in,
  input  mem_controller0_ldData_0_valid__anchors_in,
  input  mem_controller0_ldData_0_ready__anchors_in,
  input  mem_controller0_memEnd_valid__anchors_in,
  input  mem_controller0_memEnd_ready__anchors_in,
  input [31:0] mem_controller1_ldData_0__data_anchors_in,
  input  mem_controller1_ldData_0_valid__anchors_in,
  input  mem_controller1_ldData_0_ready__anchors_in,
  input  mem_controller1_memEnd_valid__anchors_in,
  input  mem_controller1_memEnd_ready__anchors_in,
  input  constant0_outs__data_anchors_in,
  input  constant0_outs_valid__anchors_in,
  input  constant0_outs_ready__anchors_in,
  input  fork1_outs_0__data_anchors_in,
  input  fork1_outs_0_valid__anchors_in,
  input  fork1_outs_0_ready__anchors_in,
  input  fork1_outs_1__data_anchors_in,
  input  fork1_outs_1_valid__anchors_in,
  input  fork1_outs_1_ready__anchors_in,
  input [10:0] extsi5_outs__data_anchors_in,
  input  extsi5_outs_valid__anchors_in,
  input  extsi5_outs_ready__anchors_in,
  input [31:0] extsi6_outs__data_anchors_in,
  input  extsi6_outs_valid__anchors_in,
  input  extsi6_outs_ready__anchors_in,
  input [10:0] buffer0_outs__data_anchors_in,
  input  buffer0_outs_valid__anchors_in,
  input  buffer0_outs_ready__anchors_in,
  input [10:0] buffer1_outs__data_anchors_in,
  input  buffer1_outs_valid__anchors_in,
  input  buffer1_outs_ready__anchors_in,
  input [10:0] mux2_outs__data_anchors_in,
  input  mux2_outs_valid__anchors_in,
  input  mux2_outs_ready__anchors_in,
  input [10:0] fork2_outs_0__data_anchors_in,
  input  fork2_outs_0_valid__anchors_in,
  input  fork2_outs_0_ready__anchors_in,
  input [10:0] fork2_outs_1__data_anchors_in,
  input  fork2_outs_1_valid__anchors_in,
  input  fork2_outs_1_ready__anchors_in,
  input [10:0] fork2_outs_2__data_anchors_in,
  input  fork2_outs_2_valid__anchors_in,
  input  fork2_outs_2_ready__anchors_in,
  input [11:0] extsi7_outs__data_anchors_in,
  input  extsi7_outs_valid__anchors_in,
  input  extsi7_outs_ready__anchors_in,
  input [11:0] extsi8_outs__data_anchors_in,
  input  extsi8_outs_valid__anchors_in,
  input  extsi8_outs_ready__anchors_in,
  input [31:0] extsi9_outs__data_anchors_in,
  input  extsi9_outs_valid__anchors_in,
  input  extsi9_outs_ready__anchors_in,
  input [31:0] buffer2_outs__data_anchors_in,
  input  buffer2_outs_valid__anchors_in,
  input  buffer2_outs_ready__anchors_in,
  input [31:0] buffer3_outs__data_anchors_in,
  input  buffer3_outs_valid__anchors_in,
  input  buffer3_outs_ready__anchors_in,
  input [31:0] mux1_outs__data_anchors_in,
  input  mux1_outs_valid__anchors_in,
  input  mux1_outs_ready__anchors_in,
  input  buffer4_outs_valid__anchors_in,
  input  buffer4_outs_ready__anchors_in,
  input  buffer5_outs_valid__anchors_in,
  input  buffer5_outs_ready__anchors_in,
  input  control_merge0_outs_valid__anchors_in,
  input  control_merge0_outs_ready__anchors_in,
  input  control_merge0_index__data_anchors_in,
  input  control_merge0_index_valid__anchors_in,
  input  control_merge0_index_ready__anchors_in,
  input  fork3_outs_0__data_anchors_in,
  input  fork3_outs_0_valid__anchors_in,
  input  fork3_outs_0_ready__anchors_in,
  input  fork3_outs_1__data_anchors_in,
  input  fork3_outs_1_valid__anchors_in,
  input  fork3_outs_1_ready__anchors_in,
  input  source0_outs_valid__anchors_in,
  input  source0_outs_ready__anchors_in,
  input [10:0] constant1_outs__data_anchors_in,
  input  constant1_outs_valid__anchors_in,
  input  constant1_outs_ready__anchors_in,
  input [11:0] extsi10_outs__data_anchors_in,
  input  extsi10_outs_valid__anchors_in,
  input  extsi10_outs_ready__anchors_in,
  input  source1_outs_valid__anchors_in,
  input  source1_outs_ready__anchors_in,
  input [10:0] constant4_outs__data_anchors_in,
  input  constant4_outs_valid__anchors_in,
  input  constant4_outs_ready__anchors_in,
  input [11:0] extsi11_outs__data_anchors_in,
  input  extsi11_outs_valid__anchors_in,
  input  extsi11_outs_ready__anchors_in,
  input  source2_outs_valid__anchors_in,
  input  source2_outs_ready__anchors_in,
  input [1:0] constant8_outs__data_anchors_in,
  input  constant8_outs_valid__anchors_in,
  input  constant8_outs_ready__anchors_in,
  input [11:0] extsi12_outs__data_anchors_in,
  input  extsi12_outs_valid__anchors_in,
  input  extsi12_outs_ready__anchors_in,
  input [31:0] mc_load0_addrOut__data_anchors_in,
  input  mc_load0_addrOut_valid__anchors_in,
  input  mc_load0_addrOut_ready__anchors_in,
  input [31:0] mc_load0_dataOut__data_anchors_in,
  input  mc_load0_dataOut_valid__anchors_in,
  input  mc_load0_dataOut_ready__anchors_in,
  input [11:0] subi1_result__data_anchors_in,
  input  subi1_result_valid__anchors_in,
  input  subi1_result_ready__anchors_in,
  input [31:0] extsi13_outs__data_anchors_in,
  input  extsi13_outs_valid__anchors_in,
  input  extsi13_outs_ready__anchors_in,
  input [31:0] mc_load1_addrOut__data_anchors_in,
  input  mc_load1_addrOut_valid__anchors_in,
  input  mc_load1_addrOut_ready__anchors_in,
  input [31:0] mc_load1_dataOut__data_anchors_in,
  input  mc_load1_dataOut_valid__anchors_in,
  input  mc_load1_dataOut_ready__anchors_in,
  input [31:0] muli0_result__data_anchors_in,
  input  muli0_result_valid__anchors_in,
  input  muli0_result_ready__anchors_in,
  input [31:0] addi0_result__data_anchors_in,
  input  addi0_result_valid__anchors_in,
  input  addi0_result_ready__anchors_in,
  input [11:0] addi1_result__data_anchors_in,
  input  addi1_result_valid__anchors_in,
  input  addi1_result_ready__anchors_in,
  input [11:0] fork4_outs_0__data_anchors_in,
  input  fork4_outs_0_valid__anchors_in,
  input  fork4_outs_0_ready__anchors_in,
  input [11:0] fork4_outs_1__data_anchors_in,
  input  fork4_outs_1_valid__anchors_in,
  input  fork4_outs_1_ready__anchors_in,
  input [10:0] trunci0_outs__data_anchors_in,
  input  trunci0_outs_valid__anchors_in,
  input  trunci0_outs_ready__anchors_in,
  input  cmpi1_result__data_anchors_in,
  input  cmpi1_result_valid__anchors_in,
  input  cmpi1_result_ready__anchors_in,
  input  fork5_outs_0__data_anchors_in,
  input  fork5_outs_0_valid__anchors_in,
  input  fork5_outs_0_ready__anchors_in,
  input  fork5_outs_1__data_anchors_in,
  input  fork5_outs_1_valid__anchors_in,
  input  fork5_outs_1_ready__anchors_in,
  input  fork5_outs_2__data_anchors_in,
  input  fork5_outs_2_valid__anchors_in,
  input  fork5_outs_2_ready__anchors_in,
  input [10:0] cond_br0_trueOut__data_anchors_in,
  input  cond_br0_trueOut_valid__anchors_in,
  input  cond_br0_trueOut_ready__anchors_in,
  input [10:0] cond_br0_falseOut__data_anchors_in,
  input  cond_br0_falseOut_valid__anchors_in,
  input  cond_br0_falseOut_ready__anchors_in,
  input [31:0] cond_br2_trueOut__data_anchors_in,
  input  cond_br2_trueOut_valid__anchors_in,
  input  cond_br2_trueOut_ready__anchors_in,
  input [31:0] cond_br2_falseOut__data_anchors_in,
  input  cond_br2_falseOut_valid__anchors_in,
  input  cond_br2_falseOut_ready__anchors_in,
  input  cond_br3_trueOut_valid__anchors_in,
  input  cond_br3_trueOut_ready__anchors_in,
  input  cond_br3_falseOut_valid__anchors_in,
  input  cond_br3_falseOut_ready__anchors_in,
  input  fork6_outs_0_valid__anchors_in,
  input  fork6_outs_0_ready__anchors_in,
  input  fork6_outs_1_valid__anchors_in,
  input  fork6_outs_1_ready__anchors_in,
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
  output [31:0] idx_storeData,
  output  fork0_outs_0_valid__anchors_out,
  output  fork0_outs_0_ready__anchors_out,
  output  fork0_outs_1_valid__anchors_out,
  output  fork0_outs_1_ready__anchors_out,
  output  fork0_outs_2_valid__anchors_out,
  output  fork0_outs_2_ready__anchors_out,
  output [31:0] mem_controller0_ldData_0__data_anchors_out,
  output  mem_controller0_ldData_0_valid__anchors_out,
  output  mem_controller0_ldData_0_ready__anchors_out,
  output  mem_controller0_memEnd_valid__anchors_out,
  output  mem_controller0_memEnd_ready__anchors_out,
  output [31:0] mem_controller1_ldData_0__data_anchors_out,
  output  mem_controller1_ldData_0_valid__anchors_out,
  output  mem_controller1_ldData_0_ready__anchors_out,
  output  mem_controller1_memEnd_valid__anchors_out,
  output  mem_controller1_memEnd_ready__anchors_out,
  output  constant0_outs__data_anchors_out,
  output  constant0_outs_valid__anchors_out,
  output  constant0_outs_ready__anchors_out,
  output  fork1_outs_0__data_anchors_out,
  output  fork1_outs_0_valid__anchors_out,
  output  fork1_outs_0_ready__anchors_out,
  output  fork1_outs_1__data_anchors_out,
  output  fork1_outs_1_valid__anchors_out,
  output  fork1_outs_1_ready__anchors_out,
  output [10:0] extsi5_outs__data_anchors_out,
  output  extsi5_outs_valid__anchors_out,
  output  extsi5_outs_ready__anchors_out,
  output [31:0] extsi6_outs__data_anchors_out,
  output  extsi6_outs_valid__anchors_out,
  output  extsi6_outs_ready__anchors_out,
  output [10:0] buffer0_outs__data_anchors_out,
  output  buffer0_outs_valid__anchors_out,
  output  buffer0_outs_ready__anchors_out,
  output [10:0] buffer1_outs__data_anchors_out,
  output  buffer1_outs_valid__anchors_out,
  output  buffer1_outs_ready__anchors_out,
  output [10:0] mux2_outs__data_anchors_out,
  output  mux2_outs_valid__anchors_out,
  output  mux2_outs_ready__anchors_out,
  output [10:0] fork2_outs_0__data_anchors_out,
  output  fork2_outs_0_valid__anchors_out,
  output  fork2_outs_0_ready__anchors_out,
  output [10:0] fork2_outs_1__data_anchors_out,
  output  fork2_outs_1_valid__anchors_out,
  output  fork2_outs_1_ready__anchors_out,
  output [10:0] fork2_outs_2__data_anchors_out,
  output  fork2_outs_2_valid__anchors_out,
  output  fork2_outs_2_ready__anchors_out,
  output [11:0] extsi7_outs__data_anchors_out,
  output  extsi7_outs_valid__anchors_out,
  output  extsi7_outs_ready__anchors_out,
  output [11:0] extsi8_outs__data_anchors_out,
  output  extsi8_outs_valid__anchors_out,
  output  extsi8_outs_ready__anchors_out,
  output [31:0] extsi9_outs__data_anchors_out,
  output  extsi9_outs_valid__anchors_out,
  output  extsi9_outs_ready__anchors_out,
  output [31:0] buffer2_outs__data_anchors_out,
  output  buffer2_outs_valid__anchors_out,
  output  buffer2_outs_ready__anchors_out,
  output [31:0] buffer3_outs__data_anchors_out,
  output  buffer3_outs_valid__anchors_out,
  output  buffer3_outs_ready__anchors_out,
  output [31:0] mux1_outs__data_anchors_out,
  output  mux1_outs_valid__anchors_out,
  output  mux1_outs_ready__anchors_out,
  output  buffer4_outs_valid__anchors_out,
  output  buffer4_outs_ready__anchors_out,
  output  buffer5_outs_valid__anchors_out,
  output  buffer5_outs_ready__anchors_out,
  output  control_merge0_outs_valid__anchors_out,
  output  control_merge0_outs_ready__anchors_out,
  output  control_merge0_index__data_anchors_out,
  output  control_merge0_index_valid__anchors_out,
  output  control_merge0_index_ready__anchors_out,
  output  fork3_outs_0__data_anchors_out,
  output  fork3_outs_0_valid__anchors_out,
  output  fork3_outs_0_ready__anchors_out,
  output  fork3_outs_1__data_anchors_out,
  output  fork3_outs_1_valid__anchors_out,
  output  fork3_outs_1_ready__anchors_out,
  output  source0_outs_valid__anchors_out,
  output  source0_outs_ready__anchors_out,
  output [10:0] constant1_outs__data_anchors_out,
  output  constant1_outs_valid__anchors_out,
  output  constant1_outs_ready__anchors_out,
  output [11:0] extsi10_outs__data_anchors_out,
  output  extsi10_outs_valid__anchors_out,
  output  extsi10_outs_ready__anchors_out,
  output  source1_outs_valid__anchors_out,
  output  source1_outs_ready__anchors_out,
  output [10:0] constant4_outs__data_anchors_out,
  output  constant4_outs_valid__anchors_out,
  output  constant4_outs_ready__anchors_out,
  output [11:0] extsi11_outs__data_anchors_out,
  output  extsi11_outs_valid__anchors_out,
  output  extsi11_outs_ready__anchors_out,
  output  source2_outs_valid__anchors_out,
  output  source2_outs_ready__anchors_out,
  output [1:0] constant8_outs__data_anchors_out,
  output  constant8_outs_valid__anchors_out,
  output  constant8_outs_ready__anchors_out,
  output [11:0] extsi12_outs__data_anchors_out,
  output  extsi12_outs_valid__anchors_out,
  output  extsi12_outs_ready__anchors_out,
  output [31:0] mc_load0_addrOut__data_anchors_out,
  output  mc_load0_addrOut_valid__anchors_out,
  output  mc_load0_addrOut_ready__anchors_out,
  output [31:0] mc_load0_dataOut__data_anchors_out,
  output  mc_load0_dataOut_valid__anchors_out,
  output  mc_load0_dataOut_ready__anchors_out,
  output [11:0] subi1_result__data_anchors_out,
  output  subi1_result_valid__anchors_out,
  output  subi1_result_ready__anchors_out,
  output [31:0] extsi13_outs__data_anchors_out,
  output  extsi13_outs_valid__anchors_out,
  output  extsi13_outs_ready__anchors_out,
  output [31:0] mc_load1_addrOut__data_anchors_out,
  output  mc_load1_addrOut_valid__anchors_out,
  output  mc_load1_addrOut_ready__anchors_out,
  output [31:0] mc_load1_dataOut__data_anchors_out,
  output  mc_load1_dataOut_valid__anchors_out,
  output  mc_load1_dataOut_ready__anchors_out,
  output [31:0] muli0_result__data_anchors_out,
  output  muli0_result_valid__anchors_out,
  output  muli0_result_ready__anchors_out,
  output [31:0] addi0_result__data_anchors_out,
  output  addi0_result_valid__anchors_out,
  output  addi0_result_ready__anchors_out,
  output [11:0] addi1_result__data_anchors_out,
  output  addi1_result_valid__anchors_out,
  output  addi1_result_ready__anchors_out,
  output [11:0] fork4_outs_0__data_anchors_out,
  output  fork4_outs_0_valid__anchors_out,
  output  fork4_outs_0_ready__anchors_out,
  output [11:0] fork4_outs_1__data_anchors_out,
  output  fork4_outs_1_valid__anchors_out,
  output  fork4_outs_1_ready__anchors_out,
  output [10:0] trunci0_outs__data_anchors_out,
  output  trunci0_outs_valid__anchors_out,
  output  trunci0_outs_ready__anchors_out,
  output  cmpi1_result__data_anchors_out,
  output  cmpi1_result_valid__anchors_out,
  output  cmpi1_result_ready__anchors_out,
  output  fork5_outs_0__data_anchors_out,
  output  fork5_outs_0_valid__anchors_out,
  output  fork5_outs_0_ready__anchors_out,
  output  fork5_outs_1__data_anchors_out,
  output  fork5_outs_1_valid__anchors_out,
  output  fork5_outs_1_ready__anchors_out,
  output  fork5_outs_2__data_anchors_out,
  output  fork5_outs_2_valid__anchors_out,
  output  fork5_outs_2_ready__anchors_out,
  output [10:0] cond_br0_trueOut__data_anchors_out,
  output  cond_br0_trueOut_valid__anchors_out,
  output  cond_br0_trueOut_ready__anchors_out,
  output [10:0] cond_br0_falseOut__data_anchors_out,
  output  cond_br0_falseOut_valid__anchors_out,
  output  cond_br0_falseOut_ready__anchors_out,
  output [31:0] cond_br2_trueOut__data_anchors_out,
  output  cond_br2_trueOut_valid__anchors_out,
  output  cond_br2_trueOut_ready__anchors_out,
  output [31:0] cond_br2_falseOut__data_anchors_out,
  output  cond_br2_falseOut_valid__anchors_out,
  output  cond_br2_falseOut_ready__anchors_out,
  output  cond_br3_trueOut_valid__anchors_out,
  output  cond_br3_trueOut_ready__anchors_out,
  output  cond_br3_falseOut_valid__anchors_out,
  output  cond_br3_falseOut_ready__anchors_out,
  output  fork6_outs_0_valid__anchors_out,
  output  fork6_outs_0_ready__anchors_out,
  output  fork6_outs_1_valid__anchors_out,
  output  fork6_outs_1_ready__anchors_out
);
  wire  mem_controller0_loadEn;
  wire [31:0] mem_controller0_loadAddr;
  wire  mem_controller0_storeEn;
  wire [31:0] mem_controller0_storeAddr;
  wire [31:0] mem_controller0_storeData;
  wire  mem_controller1_loadEn;
  wire [31:0] mem_controller1_loadAddr;
  wire  mem_controller1_storeEn;
  wire [31:0] mem_controller1_storeAddr;
  wire [31:0] mem_controller1_storeData;

  // module outputs
  assign out0 = cond_br2_falseOut__data_anchors_out;
  assign out0_valid = cond_br2_falseOut_valid__anchors_out;
  assign cond_br2_falseOut_ready = out0_ready;
  assign di_end_valid = mem_controller1_memEnd_valid__anchors_out;
  assign mem_controller1_memEnd_ready = di_end_ready;
  assign idx_end_valid = mem_controller0_memEnd_valid__anchors_out;
  assign mem_controller0_memEnd_ready = idx_end_ready;
  assign end_valid = fork0_outs_1_valid__anchors_out;
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
.outs_ready ({fork0_outs_2_ready__anchors_in, fork0_outs_1_ready__anchors_in, fork0_outs_0_ready__anchors_in}),
.outs_valid ({fork0_outs_2_valid__anchors_out, fork0_outs_1_valid__anchors_out, fork0_outs_0_valid__anchors_out}),
.rst (rst)
);

mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(32), .ADDR_TYPE(32)) mem_controller0(
.clk (clk),
.ctrlEnd_ready (fork6_outs_0_ready__anchors_out),
.ctrlEnd_valid (fork6_outs_0_valid__anchors_in),
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
.ctrlEnd_ready (fork6_outs_1_ready__anchors_out),
.ctrlEnd_valid (fork6_outs_1_valid__anchors_in),
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
.ctrl_ready (fork0_outs_0_ready__anchors_out),
.ctrl_valid (fork0_outs_0_valid__anchors_in),
.outs (constant0_outs__data_anchors_out),
.outs_ready (constant0_outs_ready__anchors_in),
.outs_valid (constant0_outs_valid__anchors_out),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(1)) fork1(
.clk (clk),
.ins (constant0_outs__data_anchors_in),
.ins_ready (constant0_outs_ready__anchors_out),
.ins_valid (constant0_outs_valid__anchors_in),
.outs ({fork1_outs_1__data_anchors_out, fork1_outs_0__data_anchors_out}),
.outs_ready ({fork1_outs_1_ready__anchors_in, fork1_outs_0_ready__anchors_in}),
.outs_valid ({fork1_outs_1_valid__anchors_out, fork1_outs_0_valid__anchors_out}),
.rst (rst)
);

extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(11)) extsi5(
.clk (clk),
.ins (fork1_outs_0__data_anchors_in),
.ins_ready (fork1_outs_0_ready__anchors_out),
.ins_valid (fork1_outs_0_valid__anchors_in),
.outs (extsi5_outs__data_anchors_out),
.outs_ready (extsi5_outs_ready__anchors_in),
.outs_valid (extsi5_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(32)) extsi6(
.clk (clk),
.ins (fork1_outs_1__data_anchors_in),
.ins_ready (fork1_outs_1_ready__anchors_out),
.ins_valid (fork1_outs_1_valid__anchors_in),
.outs (extsi6_outs__data_anchors_out),
.outs_ready (extsi6_outs_ready__anchors_in),
.outs_valid (extsi6_outs_valid__anchors_out),
.rst (rst)
);

oehb #(.DATA_TYPE(11)) buffer0(
.clk (clk),
.ins (cond_br0_trueOut__data_anchors_in),
.ins_ready (cond_br0_trueOut_ready__anchors_out),
.ins_valid (cond_br0_trueOut_valid__anchors_in),
.outs (buffer0_outs__data_anchors_out),
.outs_ready (buffer0_outs_ready__anchors_in),
.outs_valid (buffer0_outs_valid__anchors_out),
.rst (rst)
);

tehb #(.DATA_TYPE(11)) buffer1(
.clk (clk),
.ins (buffer0_outs__data_anchors_in),
.ins_ready (buffer0_outs_ready__anchors_out),
.ins_valid (buffer0_outs_valid__anchors_in),
.outs (buffer1_outs__data_anchors_out),
.outs_ready (buffer1_outs_ready__anchors_in),
.outs_valid (buffer1_outs_valid__anchors_out),
.rst (rst)
);

mux #(.SIZE(2), .DATA_TYPE(11), .SELECT_TYPE(1)) mux2(
.clk (clk),
.index (fork3_outs_0__data_anchors_in),
.index_ready (fork3_outs_0_ready__anchors_out),
.index_valid (fork3_outs_0_valid__anchors_in),
.ins ({buffer1_outs__data_anchors_in, extsi5_outs__data_anchors_in}),
.ins_ready ({buffer1_outs_ready__anchors_out, extsi5_outs_ready__anchors_out}),
.ins_valid ({buffer1_outs_valid__anchors_in, extsi5_outs_valid__anchors_in}),
.outs (mux2_outs__data_anchors_out),
.outs_ready (mux2_outs_ready__anchors_in),
.outs_valid (mux2_outs_valid__anchors_out),
.rst (rst)
);

fork_type #(.SIZE(3), .DATA_TYPE(11)) fork2(
.clk (clk),
.ins (mux2_outs__data_anchors_in),
.ins_ready (mux2_outs_ready__anchors_out),
.ins_valid (mux2_outs_valid__anchors_in),
.outs ({fork2_outs_2__data_anchors_out, fork2_outs_1__data_anchors_out, fork2_outs_0__data_anchors_out}),
.outs_ready ({fork2_outs_2_ready__anchors_in, fork2_outs_1_ready__anchors_in, fork2_outs_0_ready__anchors_in}),
.outs_valid ({fork2_outs_2_valid__anchors_out, fork2_outs_1_valid__anchors_out, fork2_outs_0_valid__anchors_out}),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi7(
.clk (clk),
.ins (fork2_outs_0__data_anchors_in),
.ins_ready (fork2_outs_0_ready__anchors_out),
.ins_valid (fork2_outs_0_valid__anchors_in),
.outs (extsi7_outs__data_anchors_out),
.outs_ready (extsi7_outs_ready__anchors_in),
.outs_valid (extsi7_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi8(
.clk (clk),
.ins (fork2_outs_1__data_anchors_in),
.ins_ready (fork2_outs_1_ready__anchors_out),
.ins_valid (fork2_outs_1_valid__anchors_in),
.outs (extsi8_outs__data_anchors_out),
.outs_ready (extsi8_outs_ready__anchors_in),
.outs_valid (extsi8_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(32)) extsi9(
.clk (clk),
.ins (fork2_outs_2__data_anchors_in),
.ins_ready (fork2_outs_2_ready__anchors_out),
.ins_valid (fork2_outs_2_valid__anchors_in),
.outs (extsi9_outs__data_anchors_out),
.outs_ready (extsi9_outs_ready__anchors_in),
.outs_valid (extsi9_outs_valid__anchors_out),
.rst (rst)
);

oehb #(.DATA_TYPE(32)) buffer2(
.clk (clk),
.ins (cond_br2_trueOut__data_anchors_in),
.ins_ready (cond_br2_trueOut_ready__anchors_out),
.ins_valid (cond_br2_trueOut_valid__anchors_in),
.outs (buffer2_outs__data_anchors_out),
.outs_ready (buffer2_outs_ready__anchors_in),
.outs_valid (buffer2_outs_valid__anchors_out),
.rst (rst)
);

tehb #(.DATA_TYPE(32)) buffer3(
.clk (clk),
.ins (buffer2_outs__data_anchors_in),
.ins_ready (buffer2_outs_ready__anchors_out),
.ins_valid (buffer2_outs_valid__anchors_in),
.outs (buffer3_outs__data_anchors_out),
.outs_ready (buffer3_outs_ready__anchors_in),
.outs_valid (buffer3_outs_valid__anchors_out),
.rst (rst)
);

mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux1(
.clk (clk),
.index (fork3_outs_1__data_anchors_in),
.index_ready (fork3_outs_1_ready__anchors_out),
.index_valid (fork3_outs_1_valid__anchors_in),
.ins ({buffer3_outs__data_anchors_in, extsi6_outs__data_anchors_in}),
.ins_ready ({buffer3_outs_ready__anchors_out, extsi6_outs_ready__anchors_out}),
.ins_valid ({buffer3_outs_valid__anchors_in, extsi6_outs_valid__anchors_in}),
.outs (mux1_outs__data_anchors_out),
.outs_ready (mux1_outs_ready__anchors_in),
.outs_valid (mux1_outs_valid__anchors_out),
.rst (rst)
);

oehb_dataless buffer4(
.clk (clk),
.ins_ready (cond_br3_trueOut_ready__anchors_out),
.ins_valid (cond_br3_trueOut_valid__anchors_in),
.outs_ready (buffer4_outs_ready__anchors_in),
.outs_valid (buffer4_outs_valid__anchors_out),
.rst (rst)
);

tehb_dataless buffer5(
.clk (clk),
.ins_ready (buffer4_outs_ready__anchors_out),
.ins_valid (buffer4_outs_valid__anchors_in),
.outs_ready (buffer5_outs_ready__anchors_in),
.outs_valid (buffer5_outs_valid__anchors_out),
.rst (rst)
);

control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
.clk (clk),
.index (control_merge0_index),
.index_ready (control_merge0_index_ready__anchors_in),
.index_valid (control_merge0_index_valid),
.ins_ready ({buffer5_outs_ready__anchors_out, fork0_outs_2_ready__anchors_out}),
.ins_valid ({buffer5_outs_valid__anchors_in, fork0_outs_2_valid__anchors_in}),
.outs_ready (control_merge0_outs_ready__anchors_in),
.outs_valid (control_merge0_outs_valid__anchors_out),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(1)) fork3(
.clk (clk),
.ins (control_merge0_index__data_anchors_in),
.ins_ready (control_merge0_index_ready__anchors_out),
.ins_valid (control_merge0_index_valid__anchors_in),
.outs ({fork3_outs_1__data_anchors_out, fork3_outs_0__data_anchors_out}),
.outs_ready ({fork3_outs_1_ready__anchors_in, fork3_outs_0_ready__anchors_in}),
.outs_valid ({fork3_outs_1_valid__anchors_out, fork3_outs_0_valid__anchors_out}),
.rst (rst)
);

source source0(
.clk (clk),
.outs_ready (source0_outs_ready__anchors_in),
.outs_valid (source0_outs_valid__anchors_out),
.rst (rst)
);

handshake_constant_1 #(.DATA_WIDTH(11)) constant1(
.clk (clk),
.ctrl_ready (source0_outs_ready__anchors_out),
.ctrl_valid (source0_outs_valid__anchors_in),
.outs (constant1_outs__data_anchors_out),
.outs_ready (constant1_outs_ready__anchors_in),
.outs_valid (constant1_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi10(
.clk (clk),
.ins (constant1_outs__data_anchors_in),
.ins_ready (constant1_outs_ready__anchors_out),
.ins_valid (constant1_outs_valid__anchors_in),
.outs (extsi10_outs__data_anchors_out),
.outs_ready (extsi10_outs_ready__anchors_in),
.outs_valid (extsi10_outs_valid__anchors_out),
.rst (rst)
);

source source1(
.clk (clk),
.outs_ready (source1_outs_ready__anchors_in),
.outs_valid (source1_outs_valid__anchors_out),
.rst (rst)
);

handshake_constant_2 #(.DATA_WIDTH(11)) constant4(
.clk (clk),
.ctrl_ready (source1_outs_ready__anchors_out),
.ctrl_valid (source1_outs_valid__anchors_in),
.outs (constant4_outs__data_anchors_out),
.outs_ready (constant4_outs_ready__anchors_in),
.outs_valid (constant4_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi11(
.clk (clk),
.ins (constant4_outs__data_anchors_in),
.ins_ready (constant4_outs_ready__anchors_out),
.ins_valid (constant4_outs_valid__anchors_in),
.outs (extsi11_outs__data_anchors_out),
.outs_ready (extsi11_outs_ready__anchors_in),
.outs_valid (extsi11_outs_valid__anchors_out),
.rst (rst)
);

source source2(
.clk (clk),
.outs_ready (source2_outs_ready__anchors_in),
.outs_valid (source2_outs_valid__anchors_out),
.rst (rst)
);

handshake_constant_3 #(.DATA_WIDTH(2)) constant8(
.clk (clk),
.ctrl_ready (source2_outs_ready__anchors_out),
.ctrl_valid (source2_outs_valid__anchors_in),
.outs (constant8_outs__data_anchors_out),
.outs_ready (constant8_outs_ready__anchors_in),
.outs_valid (constant8_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(12)) extsi12(
.clk (clk),
.ins (constant8_outs__data_anchors_in),
.ins_ready (constant8_outs_ready__anchors_out),
.ins_valid (constant8_outs_valid__anchors_in),
.outs (extsi12_outs__data_anchors_out),
.outs_ready (extsi12_outs_ready__anchors_in),
.outs_valid (extsi12_outs_valid__anchors_out),
.rst (rst)
);

mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load0(
.addrIn (extsi9_outs__data_anchors_in),
.addrIn_ready (extsi9_outs_ready__anchors_out),
.addrIn_valid (extsi9_outs_valid__anchors_in),
.addrOut (mc_load0_addrOut),
.addrOut_ready (mc_load0_addrOut_ready),
.addrOut_valid (mc_load0_addrOut_valid),
.clk (clk),
.dataFromMem (mem_controller0_ldData_0__data_anchors_in),
.dataFromMem_ready (mem_controller0_ldData_0_ready__anchors_out),
.dataFromMem_valid (mem_controller0_ldData_0_valid__anchors_in),
.dataOut (mc_load0_dataOut),
.dataOut_ready (mc_load0_dataOut_ready),
.dataOut_valid (mc_load0_dataOut_valid),
.rst (rst)
);

subi #(.DATA_TYPE(12)) subi1(
.clk (clk),
.lhs (extsi10_outs__data_anchors_in),
.lhs_ready (extsi10_outs_ready__anchors_out),
.lhs_valid (extsi10_outs_valid__anchors_in),
.result (subi1_result__data_anchors_out),
.result_ready (subi1_result_ready__anchors_in),
.result_valid (subi1_result_valid__anchors_out),
.rhs (extsi8_outs__data_anchors_in),
.rhs_ready (extsi8_outs_ready__anchors_out),
.rhs_valid (extsi8_outs_valid__anchors_in),
.rst (rst)
);

extsi #(.INPUT_TYPE(12), .OUTPUT_TYPE(32)) extsi13(
.clk (clk),
.ins (subi1_result__data_anchors_in),
.ins_ready (subi1_result_ready__anchors_out),
.ins_valid (subi1_result_valid__anchors_in),
.outs (extsi13_outs__data_anchors_out),
.outs_ready (extsi13_outs_ready__anchors_in),
.outs_valid (extsi13_outs_valid__anchors_out),
.rst (rst)
);

mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load1(
.addrIn (extsi13_outs__data_anchors_in),
.addrIn_ready (extsi13_outs_ready__anchors_out),
.addrIn_valid (extsi13_outs_valid__anchors_in),
.addrOut (mc_load1_addrOut),
.addrOut_ready (mc_load1_addrOut_ready),
.addrOut_valid (mc_load1_addrOut_valid),
.clk (clk),
.dataFromMem (mem_controller1_ldData_0__data_anchors_in),
.dataFromMem_ready (mem_controller1_ldData_0_ready__anchors_out),
.dataFromMem_valid (mem_controller1_ldData_0_valid__anchors_in),
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
.result (muli0_result__data_anchors_out),
.result_ready (muli0_result_ready__anchors_in),
.result_valid (muli0_result_valid__anchors_out),
.rhs (mc_load1_dataOut),
.rhs_ready (mc_load1_dataOut_ready),
.rhs_valid (mc_load1_dataOut_valid),
.rst (rst)
);

addi #(.DATA_TYPE(32)) addi0(
.clk (clk),
.lhs (mux1_outs__data_anchors_in),
.lhs_ready (mux1_outs_ready__anchors_out),
.lhs_valid (mux1_outs_valid__anchors_in),
.result (addi0_result__data_anchors_out),
.result_ready (addi0_result_ready__anchors_in),
.result_valid (addi0_result_valid__anchors_out),
.rhs (muli0_result__data_anchors_in),
.rhs_ready (muli0_result_ready__anchors_out),
.rhs_valid (muli0_result_valid__anchors_in),
.rst (rst)
);

addi #(.DATA_TYPE(12)) addi1(
.clk (clk),
.lhs (extsi7_outs__data_anchors_in),
.lhs_ready (extsi7_outs_ready__anchors_out),
.lhs_valid (extsi7_outs_valid__anchors_in),
.result (addi1_result__data_anchors_out),
.result_ready (addi1_result_ready__anchors_in),
.result_valid (addi1_result_valid__anchors_out),
.rhs (extsi12_outs__data_anchors_in),
.rhs_ready (extsi12_outs_ready__anchors_out),
.rhs_valid (extsi12_outs_valid__anchors_in),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(12)) fork4(
.clk (clk),
.ins (addi1_result__data_anchors_in),
.ins_ready (addi1_result_ready__anchors_out),
.ins_valid (addi1_result_valid__anchors_in),
.outs ({fork4_outs_1__data_anchors_out, fork4_outs_0__data_anchors_out}),
.outs_ready ({fork4_outs_1_ready__anchors_in, fork4_outs_0_ready__anchors_in}),
.outs_valid ({fork4_outs_1_valid__anchors_out, fork4_outs_0_valid__anchors_out}),
.rst (rst)
);

trunci #(.INPUT_TYPE(12), .OUTPUT_TYPE(11)) trunci0(
.clk (clk),
.ins (fork4_outs_0__data_anchors_in),
.ins_ready (fork4_outs_0_ready__anchors_out),
.ins_valid (fork4_outs_0_valid__anchors_in),
.outs (trunci0_outs__data_anchors_out),
.outs_ready (trunci0_outs_ready__anchors_in),
.outs_valid (trunci0_outs_valid__anchors_out),
.rst (rst)
);

handshake_cmpi_0 #(.DATA_TYPE(12)) cmpi1(
.clk (clk),
.lhs (fork4_outs_1__data_anchors_in),
.lhs_ready (fork4_outs_1_ready__anchors_out),
.lhs_valid (fork4_outs_1_valid__anchors_in),
.result (cmpi1_result__data_anchors_out),
.result_ready (cmpi1_result_ready__anchors_in),
.result_valid (cmpi1_result_valid__anchors_out),
.rhs (extsi11_outs__data_anchors_in),
.rhs_ready (extsi11_outs_ready__anchors_out),
.rhs_valid (extsi11_outs_valid__anchors_in),
.rst (rst)
);

fork_type #(.SIZE(3), .DATA_TYPE(1)) fork5(
.clk (clk),
.ins (cmpi1_result__data_anchors_in),
.ins_ready (cmpi1_result_ready__anchors_out),
.ins_valid (cmpi1_result_valid__anchors_in),
.outs ({fork5_outs_2__data_anchors_out, fork5_outs_1__data_anchors_out, fork5_outs_0__data_anchors_out}),
.outs_ready ({fork5_outs_2_ready__anchors_in, fork5_outs_1_ready__anchors_in, fork5_outs_0_ready__anchors_in}),
.outs_valid ({fork5_outs_2_valid__anchors_out, fork5_outs_1_valid__anchors_out, fork5_outs_0_valid__anchors_out}),
.rst (rst)
);

cond_br #(.DATA_TYPE(11)) cond_br0(
.clk (clk),
.condition (fork5_outs_0__data_anchors_in),
.condition_ready (fork5_outs_0_ready__anchors_out),
.condition_valid (fork5_outs_0_valid__anchors_in),
.data (trunci0_outs__data_anchors_in),
.data_ready (trunci0_outs_ready__anchors_out),
.data_valid (trunci0_outs_valid__anchors_in),
.falseOut (cond_br0_falseOut__data_anchors_out),
.falseOut_ready (cond_br0_falseOut_ready__anchors_in),
.falseOut_valid (cond_br0_falseOut_valid__anchors_out),
.rst (rst),
.trueOut (cond_br0_trueOut__data_anchors_out),
.trueOut_ready (cond_br0_trueOut_ready__anchors_in),
.trueOut_valid (cond_br0_trueOut_valid__anchors_out)
);

sink #(.DATA_TYPE(11)) sink0(
.clk (clk),
.ins (cond_br0_falseOut__data_anchors_in),
.ins_ready (cond_br0_falseOut_ready__anchors_out),
.ins_valid (cond_br0_falseOut_valid__anchors_in),
.rst (rst)
);

cond_br #(.DATA_TYPE(32)) cond_br2(
.clk (clk),
.condition (fork5_outs_1__data_anchors_in),
.condition_ready (fork5_outs_1_ready__anchors_out),
.condition_valid (fork5_outs_1_valid__anchors_in),
.data (addi0_result__data_anchors_in),
.data_ready (addi0_result_ready__anchors_out),
.data_valid (addi0_result_valid__anchors_in),
.falseOut (cond_br2_falseOut__data_anchors_out),
.falseOut_ready (cond_br2_falseOut_ready__anchors_in),
.falseOut_valid (cond_br2_falseOut_valid__anchors_out),
.rst (rst),
.trueOut (cond_br2_trueOut__data_anchors_out),
.trueOut_ready (cond_br2_trueOut_ready__anchors_in),
.trueOut_valid (cond_br2_trueOut_valid__anchors_out)
);

cond_br_dataless cond_br3(
.clk (clk),
.condition (fork5_outs_2__data_anchors_in),
.condition_ready (fork5_outs_2_ready__anchors_out),
.condition_valid (fork5_outs_2_valid__anchors_in),
.data_ready (control_merge0_outs_ready__anchors_out),
.data_valid (control_merge0_outs_valid__anchors_in),
.falseOut_ready (cond_br3_falseOut_ready__anchors_in),
.falseOut_valid (cond_br3_falseOut_valid__anchors_out),
.rst (rst),
.trueOut_ready (cond_br3_trueOut_ready__anchors_in),
.trueOut_valid (cond_br3_trueOut_valid__anchors_out)
);

fork_dataless #(.SIZE(2)) fork6(
.clk (clk),
.ins_ready (cond_br3_falseOut_ready__anchors_out),
.ins_valid (cond_br3_falseOut_valid__anchors_in),
.outs_ready ({fork6_outs_1_ready__anchors_in, fork6_outs_0_ready__anchors_in}),
.outs_valid ({fork6_outs_1_valid__anchors_out, fork6_outs_0_valid__anchors_out}),
.rst (rst)
);

endmodule
