module if_loop_1(
  // inputs
  input [31:0] a_loadData,
  input [31:0] n,
  input  n_valid,
  input  a_start_valid,
  input  start_valid,
  input  clk,
  input  rst,
  input  out0_ready,
  input  a_end_ready,
  input  end_ready,
  input  fork0_outs_0_valid_anchors_in,
  input  fork0_outs_0_ready_anchors_in,
  input  fork0_outs_1_valid_anchors_in,
  input  fork0_outs_1_ready_anchors_in,
  input  fork0_outs_2_valid_anchors_in,
  input  fork0_outs_2_ready_anchors_in,
  input [31:0] mem_controller0_ldData_0_anchors_in,
  input  mem_controller0_ldData_0_valid_anchors_in,
  input  mem_controller0_ldData_0_ready_anchors_in,
  input  mem_controller0_memEnd_valid_anchors_in,
  input  mem_controller0_memEnd_ready_anchors_in,
  input  constant0_outs_anchors_in,
  input  constant0_outs_valid_anchors_in,
  input  constant0_outs_ready_anchors_in,
  input  fork1_outs_0_anchors_in,
  input  fork1_outs_0_valid_anchors_in,
  input  fork1_outs_0_ready_anchors_in,
  input  fork1_outs_1_anchors_in,
  input  fork1_outs_1_valid_anchors_in,
  input  fork1_outs_1_ready_anchors_in,
  input [31:0] extsi5_outs_anchors_in,
  input  extsi5_outs_valid_anchors_in,
  input  extsi5_outs_ready_anchors_in,
  input [31:0] extsi6_outs_anchors_in,
  input  extsi6_outs_valid_anchors_in,
  input  extsi6_outs_ready_anchors_in,
  input [31:0] buffer0_outs_anchors_in,
  input  buffer0_outs_valid_anchors_in,
  input  buffer0_outs_ready_anchors_in,
  input [31:0] buffer1_outs_anchors_in,
  input  buffer1_outs_valid_anchors_in,
  input  buffer1_outs_ready_anchors_in,
  input [31:0] mux0_outs_anchors_in,
  input  mux0_outs_valid_anchors_in,
  input  mux0_outs_ready_anchors_in,
  input [31:0] fork2_outs_0_anchors_in,
  input  fork2_outs_0_valid_anchors_in,
  input  fork2_outs_0_ready_anchors_in,
  input [31:0] fork2_outs_1_anchors_in,
  input  fork2_outs_1_valid_anchors_in,
  input  fork2_outs_1_ready_anchors_in,
  input [31:0] buffer2_outs_anchors_in,
  input  buffer2_outs_valid_anchors_in,
  input  buffer2_outs_ready_anchors_in,
  input [31:0] buffer3_outs_anchors_in,
  input  buffer3_outs_valid_anchors_in,
  input  buffer3_outs_ready_anchors_in,
  input [31:0] mux1_outs_anchors_in,
  input  mux1_outs_valid_anchors_in,
  input  mux1_outs_ready_anchors_in,
  input [31:0] buffer4_outs_anchors_in,
  input  buffer4_outs_valid_anchors_in,
  input  buffer4_outs_ready_anchors_in,
  input [31:0] buffer5_outs_anchors_in,
  input  buffer5_outs_valid_anchors_in,
  input  buffer5_outs_ready_anchors_in,
  input [31:0] mux2_outs_anchors_in,
  input  mux2_outs_valid_anchors_in,
  input  mux2_outs_ready_anchors_in,
  input [31:0] fork3_outs_0_anchors_in,
  input  fork3_outs_0_valid_anchors_in,
  input  fork3_outs_0_ready_anchors_in,
  input [31:0] fork3_outs_1_anchors_in,
  input  fork3_outs_1_valid_anchors_in,
  input  fork3_outs_1_ready_anchors_in,
  input  buffer6_outs_valid_anchors_in,
  input  buffer6_outs_ready_anchors_in,
  input  buffer7_outs_valid_anchors_in,
  input  buffer7_outs_ready_anchors_in,
  input  control_merge0_outs_valid_anchors_in,
  input  control_merge0_outs_ready_anchors_in,
  input  control_merge0_index_anchors_in,
  input  control_merge0_index_valid_anchors_in,
  input  control_merge0_index_ready_anchors_in,
  input  fork4_outs_0_anchors_in,
  input  fork4_outs_0_valid_anchors_in,
  input  fork4_outs_0_ready_anchors_in,
  input  fork4_outs_1_anchors_in,
  input  fork4_outs_1_valid_anchors_in,
  input  fork4_outs_1_ready_anchors_in,
  input  fork4_outs_2_anchors_in,
  input  fork4_outs_2_valid_anchors_in,
  input  fork4_outs_2_ready_anchors_in,
  input  cmpi1_result_anchors_in,
  input  cmpi1_result_valid_anchors_in,
  input  cmpi1_result_ready_anchors_in,
  input  fork5_outs_0_anchors_in,
  input  fork5_outs_0_valid_anchors_in,
  input  fork5_outs_0_ready_anchors_in,
  input  fork5_outs_1_anchors_in,
  input  fork5_outs_1_valid_anchors_in,
  input  fork5_outs_1_ready_anchors_in,
  input  fork5_outs_2_anchors_in,
  input  fork5_outs_2_valid_anchors_in,
  input  fork5_outs_2_ready_anchors_in,
  input  fork5_outs_3_anchors_in,
  input  fork5_outs_3_valid_anchors_in,
  input  fork5_outs_3_ready_anchors_in,
  input [31:0] cond_br1_trueOut_anchors_in,
  input  cond_br1_trueOut_valid_anchors_in,
  input  cond_br1_trueOut_ready_anchors_in,
  input [31:0] cond_br1_falseOut_anchors_in,
  input  cond_br1_falseOut_valid_anchors_in,
  input  cond_br1_falseOut_ready_anchors_in,
  input [31:0] cond_br2_trueOut_anchors_in,
  input  cond_br2_trueOut_valid_anchors_in,
  input  cond_br2_trueOut_ready_anchors_in,
  input [31:0] cond_br2_falseOut_anchors_in,
  input  cond_br2_falseOut_valid_anchors_in,
  input  cond_br2_falseOut_ready_anchors_in,
  input [31:0] cond_br3_trueOut_anchors_in,
  input  cond_br3_trueOut_valid_anchors_in,
  input  cond_br3_trueOut_ready_anchors_in,
  input [31:0] cond_br3_falseOut_anchors_in,
  input  cond_br3_falseOut_valid_anchors_in,
  input  cond_br3_falseOut_ready_anchors_in,
  input  cond_br4_trueOut_valid_anchors_in,
  input  cond_br4_trueOut_ready_anchors_in,
  input  cond_br4_falseOut_valid_anchors_in,
  input  cond_br4_falseOut_ready_anchors_in,
  input [31:0] fork6_outs_0_anchors_in,
  input  fork6_outs_0_valid_anchors_in,
  input  fork6_outs_0_ready_anchors_in,
  input [31:0] fork6_outs_1_anchors_in,
  input  fork6_outs_1_valid_anchors_in,
  input  fork6_outs_1_ready_anchors_in,
  input [31:0] fork7_outs_0_anchors_in,
  input  fork7_outs_0_valid_anchors_in,
  input  fork7_outs_0_ready_anchors_in,
  input [31:0] fork7_outs_1_anchors_in,
  input  fork7_outs_1_valid_anchors_in,
  input  fork7_outs_1_ready_anchors_in,
  input  source0_outs_valid_anchors_in,
  input  source0_outs_ready_anchors_in,
  input [1:0] constant2_outs_anchors_in,
  input  constant2_outs_valid_anchors_in,
  input  constant2_outs_ready_anchors_in,
  input [31:0] extsi2_outs_anchors_in,
  input  extsi2_outs_valid_anchors_in,
  input  extsi2_outs_ready_anchors_in,
  input  source1_outs_valid_anchors_in,
  input  source1_outs_ready_anchors_in,
  input [4:0] constant4_outs_anchors_in,
  input  constant4_outs_valid_anchors_in,
  input  constant4_outs_ready_anchors_in,
  input [31:0] extsi3_outs_anchors_in,
  input  extsi3_outs_valid_anchors_in,
  input  extsi3_outs_ready_anchors_in,
  input  source2_outs_valid_anchors_in,
  input  source2_outs_ready_anchors_in,
  input [2:0] constant8_outs_anchors_in,
  input  constant8_outs_valid_anchors_in,
  input  constant8_outs_ready_anchors_in,
  input [31:0] extsi4_outs_anchors_in,
  input  extsi4_outs_valid_anchors_in,
  input  extsi4_outs_ready_anchors_in,
  input [31:0] mc_load0_addrOut_anchors_in,
  input  mc_load0_addrOut_valid_anchors_in,
  input  mc_load0_addrOut_ready_anchors_in,
  input [31:0] mc_load0_dataOut_anchors_in,
  input  mc_load0_dataOut_valid_anchors_in,
  input  mc_load0_dataOut_ready_anchors_in,
  input [31:0] fork8_outs_0_anchors_in,
  input  fork8_outs_0_valid_anchors_in,
  input  fork8_outs_0_ready_anchors_in,
  input [31:0] fork8_outs_1_anchors_in,
  input  fork8_outs_1_valid_anchors_in,
  input  fork8_outs_1_ready_anchors_in,
  input [31:0] shli0_result_anchors_in,
  input  shli0_result_valid_anchors_in,
  input  shli0_result_ready_anchors_in,
  input [31:0] addi2_result_anchors_in,
  input  addi2_result_valid_anchors_in,
  input  addi2_result_ready_anchors_in,
  input [31:0] fork9_outs_0_anchors_in,
  input  fork9_outs_0_valid_anchors_in,
  input  fork9_outs_0_ready_anchors_in,
  input [31:0] fork9_outs_1_anchors_in,
  input  fork9_outs_1_valid_anchors_in,
  input  fork9_outs_1_ready_anchors_in,
  input  cmpi0_result_anchors_in,
  input  cmpi0_result_valid_anchors_in,
  input  cmpi0_result_ready_anchors_in,
  input [31:0] addi1_result_anchors_in,
  input  addi1_result_valid_anchors_in,
  input  addi1_result_ready_anchors_in,
  input [31:0] select0_result_anchors_in,
  input  select0_result_valid_anchors_in,
  input  select0_result_ready_anchors_in,
  input [31:0] addi0_result_anchors_in,
  input  addi0_result_valid_anchors_in,
  input  addi0_result_ready_anchors_in,
  // outputs
  output  n_ready,
  output  a_start_ready,
  output  start_ready,
  output [31:0] out0,
  output  out0_valid,
  output  a_end_valid,
  output  end_valid,
  output  a_loadEn,
  output [31:0] a_loadAddr,
  output  a_storeEn,
  output [31:0] a_storeAddr,
  output [31:0] a_storeData,
  output  fork0_outs_0_valid_anchors_out,
  output  fork0_outs_0_ready_anchors_out,
  output  fork0_outs_1_valid_anchors_out,
  output  fork0_outs_1_ready_anchors_out,
  output  fork0_outs_2_valid_anchors_out,
  output  fork0_outs_2_ready_anchors_out,
  output [31:0] mem_controller0_ldData_0_anchors_out,
  output  mem_controller0_ldData_0_valid_anchors_out,
  output  mem_controller0_ldData_0_ready_anchors_out,
  output  mem_controller0_memEnd_valid_anchors_out,
  output  mem_controller0_memEnd_ready_anchors_out,
  output  constant0_outs_anchors_out,
  output  constant0_outs_valid_anchors_out,
  output  constant0_outs_ready_anchors_out,
  output  fork1_outs_0_anchors_out,
  output  fork1_outs_0_valid_anchors_out,
  output  fork1_outs_0_ready_anchors_out,
  output  fork1_outs_1_anchors_out,
  output  fork1_outs_1_valid_anchors_out,
  output  fork1_outs_1_ready_anchors_out,
  output [31:0] extsi5_outs_anchors_out,
  output  extsi5_outs_valid_anchors_out,
  output  extsi5_outs_ready_anchors_out,
  output [31:0] extsi6_outs_anchors_out,
  output  extsi6_outs_valid_anchors_out,
  output  extsi6_outs_ready_anchors_out,
  output [31:0] buffer0_outs_anchors_out,
  output  buffer0_outs_valid_anchors_out,
  output  buffer0_outs_ready_anchors_out,
  output [31:0] buffer1_outs_anchors_out,
  output  buffer1_outs_valid_anchors_out,
  output  buffer1_outs_ready_anchors_out,
  output [31:0] mux0_outs_anchors_out,
  output  mux0_outs_valid_anchors_out,
  output  mux0_outs_ready_anchors_out,
  output [31:0] fork2_outs_0_anchors_out,
  output  fork2_outs_0_valid_anchors_out,
  output  fork2_outs_0_ready_anchors_out,
  output [31:0] fork2_outs_1_anchors_out,
  output  fork2_outs_1_valid_anchors_out,
  output  fork2_outs_1_ready_anchors_out,
  output [31:0] buffer2_outs_anchors_out,
  output  buffer2_outs_valid_anchors_out,
  output  buffer2_outs_ready_anchors_out,
  output [31:0] buffer3_outs_anchors_out,
  output  buffer3_outs_valid_anchors_out,
  output  buffer3_outs_ready_anchors_out,
  output [31:0] mux1_outs_anchors_out,
  output  mux1_outs_valid_anchors_out,
  output  mux1_outs_ready_anchors_out,
  output [31:0] buffer4_outs_anchors_out,
  output  buffer4_outs_valid_anchors_out,
  output  buffer4_outs_ready_anchors_out,
  output [31:0] buffer5_outs_anchors_out,
  output  buffer5_outs_valid_anchors_out,
  output  buffer5_outs_ready_anchors_out,
  output [31:0] mux2_outs_anchors_out,
  output  mux2_outs_valid_anchors_out,
  output  mux2_outs_ready_anchors_out,
  output [31:0] fork3_outs_0_anchors_out,
  output  fork3_outs_0_valid_anchors_out,
  output  fork3_outs_0_ready_anchors_out,
  output [31:0] fork3_outs_1_anchors_out,
  output  fork3_outs_1_valid_anchors_out,
  output  fork3_outs_1_ready_anchors_out,
  output  buffer6_outs_valid_anchors_out,
  output  buffer6_outs_ready_anchors_out,
  output  buffer7_outs_valid_anchors_out,
  output  buffer7_outs_ready_anchors_out,
  output  control_merge0_outs_valid_anchors_out,
  output  control_merge0_outs_ready_anchors_out,
  output  control_merge0_index_anchors_out,
  output  control_merge0_index_valid_anchors_out,
  output  control_merge0_index_ready_anchors_out,
  output  fork4_outs_0_anchors_out,
  output  fork4_outs_0_valid_anchors_out,
  output  fork4_outs_0_ready_anchors_out,
  output  fork4_outs_1_anchors_out,
  output  fork4_outs_1_valid_anchors_out,
  output  fork4_outs_1_ready_anchors_out,
  output  fork4_outs_2_anchors_out,
  output  fork4_outs_2_valid_anchors_out,
  output  fork4_outs_2_ready_anchors_out,
  output  cmpi1_result_anchors_out,
  output  cmpi1_result_valid_anchors_out,
  output  cmpi1_result_ready_anchors_out,
  output  fork5_outs_0_anchors_out,
  output  fork5_outs_0_valid_anchors_out,
  output  fork5_outs_0_ready_anchors_out,
  output  fork5_outs_1_anchors_out,
  output  fork5_outs_1_valid_anchors_out,
  output  fork5_outs_1_ready_anchors_out,
  output  fork5_outs_2_anchors_out,
  output  fork5_outs_2_valid_anchors_out,
  output  fork5_outs_2_ready_anchors_out,
  output  fork5_outs_3_anchors_out,
  output  fork5_outs_3_valid_anchors_out,
  output  fork5_outs_3_ready_anchors_out,
  output [31:0] cond_br1_trueOut_anchors_out,
  output  cond_br1_trueOut_valid_anchors_out,
  output  cond_br1_trueOut_ready_anchors_out,
  output [31:0] cond_br1_falseOut_anchors_out,
  output  cond_br1_falseOut_valid_anchors_out,
  output  cond_br1_falseOut_ready_anchors_out,
  output [31:0] cond_br2_trueOut_anchors_out,
  output  cond_br2_trueOut_valid_anchors_out,
  output  cond_br2_trueOut_ready_anchors_out,
  output [31:0] cond_br2_falseOut_anchors_out,
  output  cond_br2_falseOut_valid_anchors_out,
  output  cond_br2_falseOut_ready_anchors_out,
  output [31:0] cond_br3_trueOut_anchors_out,
  output  cond_br3_trueOut_valid_anchors_out,
  output  cond_br3_trueOut_ready_anchors_out,
  output [31:0] cond_br3_falseOut_anchors_out,
  output  cond_br3_falseOut_valid_anchors_out,
  output  cond_br3_falseOut_ready_anchors_out,
  output  cond_br4_trueOut_valid_anchors_out,
  output  cond_br4_trueOut_ready_anchors_out,
  output  cond_br4_falseOut_valid_anchors_out,
  output  cond_br4_falseOut_ready_anchors_out,
  output [31:0] fork6_outs_0_anchors_out,
  output  fork6_outs_0_valid_anchors_out,
  output  fork6_outs_0_ready_anchors_out,
  output [31:0] fork6_outs_1_anchors_out,
  output  fork6_outs_1_valid_anchors_out,
  output  fork6_outs_1_ready_anchors_out,
  output [31:0] fork7_outs_0_anchors_out,
  output  fork7_outs_0_valid_anchors_out,
  output  fork7_outs_0_ready_anchors_out,
  output [31:0] fork7_outs_1_anchors_out,
  output  fork7_outs_1_valid_anchors_out,
  output  fork7_outs_1_ready_anchors_out,
  output  source0_outs_valid_anchors_out,
  output  source0_outs_ready_anchors_out,
  output [1:0] constant2_outs_anchors_out,
  output  constant2_outs_valid_anchors_out,
  output  constant2_outs_ready_anchors_out,
  output [31:0] extsi2_outs_anchors_out,
  output  extsi2_outs_valid_anchors_out,
  output  extsi2_outs_ready_anchors_out,
  output  source1_outs_valid_anchors_out,
  output  source1_outs_ready_anchors_out,
  output [4:0] constant4_outs_anchors_out,
  output  constant4_outs_valid_anchors_out,
  output  constant4_outs_ready_anchors_out,
  output [31:0] extsi3_outs_anchors_out,
  output  extsi3_outs_valid_anchors_out,
  output  extsi3_outs_ready_anchors_out,
  output  source2_outs_valid_anchors_out,
  output  source2_outs_ready_anchors_out,
  output [2:0] constant8_outs_anchors_out,
  output  constant8_outs_valid_anchors_out,
  output  constant8_outs_ready_anchors_out,
  output [31:0] extsi4_outs_anchors_out,
  output  extsi4_outs_valid_anchors_out,
  output  extsi4_outs_ready_anchors_out,
  output [31:0] mc_load0_addrOut_anchors_out,
  output  mc_load0_addrOut_valid_anchors_out,
  output  mc_load0_addrOut_ready_anchors_out,
  output [31:0] mc_load0_dataOut_anchors_out,
  output  mc_load0_dataOut_valid_anchors_out,
  output  mc_load0_dataOut_ready_anchors_out,
  output [31:0] fork8_outs_0_anchors_out,
  output  fork8_outs_0_valid_anchors_out,
  output  fork8_outs_0_ready_anchors_out,
  output [31:0] fork8_outs_1_anchors_out,
  output  fork8_outs_1_valid_anchors_out,
  output  fork8_outs_1_ready_anchors_out,
  output [31:0] shli0_result_anchors_out,
  output  shli0_result_valid_anchors_out,
  output  shli0_result_ready_anchors_out,
  output [31:0] addi2_result_anchors_out,
  output  addi2_result_valid_anchors_out,
  output  addi2_result_ready_anchors_out,
  output [31:0] fork9_outs_0_anchors_out,
  output  fork9_outs_0_valid_anchors_out,
  output  fork9_outs_0_ready_anchors_out,
  output [31:0] fork9_outs_1_anchors_out,
  output  fork9_outs_1_valid_anchors_out,
  output  fork9_outs_1_ready_anchors_out,
  output  cmpi0_result_anchors_out,
  output  cmpi0_result_valid_anchors_out,
  output  cmpi0_result_ready_anchors_out,
  output [31:0] addi1_result_anchors_out,
  output  addi1_result_valid_anchors_out,
  output  addi1_result_ready_anchors_out,
  output [31:0] select0_result_anchors_out,
  output  select0_result_valid_anchors_out,
  output  select0_result_ready_anchors_out,
  output [31:0] addi0_result_anchors_out,
  output  addi0_result_valid_anchors_out,
  output  addi0_result_ready_anchors_out
);
  wire  mem_controller0_loadEn;
  wire [31:0] mem_controller0_loadAddr;
  wire  mem_controller0_storeEn;
  wire [31:0] mem_controller0_storeAddr;
  wire [31:0] mem_controller0_storeData;

  // module outputs
  assign out0 = cond_br3_falseOut_anchors_out;
  assign out0_valid = cond_br3_falseOut_valid_anchors_out;
  assign cond_br3_falseOut_ready = out0_ready;
  assign a_end_valid = mem_controller0_memEnd_valid_anchors_out;
  assign mem_controller0_memEnd_ready = a_end_ready;
  assign end_valid = fork0_outs_1_valid_anchors_out;
  assign fork0_outs_1_ready = end_ready;
  assign a_loadEn = mem_controller0_loadEn;
  assign a_loadAddr = mem_controller0_loadAddr;
  assign a_storeEn = mem_controller0_storeEn;
  assign a_storeAddr = mem_controller0_storeAddr;
  assign a_storeData = mem_controller0_storeData;



fork_dataless #(.SIZE(3)) fork0(
.clk (clk),
.ins_ready (start_ready),
.ins_valid (start_valid),
.outs_ready ({fork0_outs_2_ready_anchors_in, fork0_outs_1_ready_anchors_in, fork0_outs_0_ready_anchors_in}),
.outs_valid ({fork0_outs_2_valid_anchors_out, fork0_outs_1_valid_anchors_out, fork0_outs_0_valid_anchors_out}),
.rst (rst)
);

mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(32), .ADDR_TYPE(32)) mem_controller0(
.clk (clk),
.ctrlEnd_ready (cond_br4_falseOut_ready_anchors_out),
.ctrlEnd_valid (cond_br4_falseOut_valid_anchors_in),
.ldAddr ({mc_load0_addrOut}),
.ldAddr_ready ({mc_load0_addrOut_ready}),
.ldAddr_valid ({mc_load0_addrOut_valid}),
.ldData ({mem_controller0_ldData_0}),
.ldData_ready ({mem_controller0_ldData_0_ready}),
.ldData_valid ({mem_controller0_ldData_0_valid}),
.loadAddr (mem_controller0_loadAddr),
.loadData (a_loadData),
.loadEn (mem_controller0_loadEn),
.memEnd_ready (mem_controller0_memEnd_ready),
.memEnd_valid (mem_controller0_memEnd_valid),
.memStart_ready (a_start_ready),
.memStart_valid (a_start_valid),
.rst (rst),
.storeAddr (mem_controller0_storeAddr),
.storeData (mem_controller0_storeData),
.storeEn (mem_controller0_storeEn)
);

handshake_constant_0 #(.DATA_WIDTH(1)) constant0(
.clk (clk),
.ctrl_ready (fork0_outs_0_ready_anchors_out),
.ctrl_valid (fork0_outs_0_valid_anchors_in),
.outs (constant0_outs_anchors_out),
.outs_ready (constant0_outs_ready_anchors_in),
.outs_valid (constant0_outs_valid_anchors_out),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(1)) fork1(
.clk (clk),
.ins (constant0_outs_anchors_in),
.ins_ready (constant0_outs_ready_anchors_out),
.ins_valid (constant0_outs_valid_anchors_in),
.outs ({fork1_outs_1_anchors_out, fork1_outs_0_anchors_out}),
.outs_ready ({fork1_outs_1_ready_anchors_in, fork1_outs_0_ready_anchors_in}),
.outs_valid ({fork1_outs_1_valid_anchors_out, fork1_outs_0_valid_anchors_out}),
.rst (rst)
);

extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(32)) extsi5(
.clk (clk),
.ins (fork1_outs_0_anchors_in),
.ins_ready (fork1_outs_0_ready_anchors_out),
.ins_valid (fork1_outs_0_valid_anchors_in),
.outs (extsi5_outs_anchors_out),
.outs_ready (extsi5_outs_ready_anchors_in),
.outs_valid (extsi5_outs_valid_anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(32)) extsi6(
.clk (clk),
.ins (fork1_outs_1_anchors_in),
.ins_ready (fork1_outs_1_ready_anchors_out),
.ins_valid (fork1_outs_1_valid_anchors_in),
.outs (extsi6_outs_anchors_out),
.outs_ready (extsi6_outs_ready_anchors_in),
.outs_valid (extsi6_outs_valid_anchors_out),
.rst (rst)
);

oehb #(.DATA_TYPE(32)) buffer0(
.clk (clk),
.ins (addi0_result_anchors_in),
.ins_ready (addi0_result_ready_anchors_out),
.ins_valid (addi0_result_valid_anchors_in),
.outs (buffer0_outs_anchors_out),
.outs_ready (buffer0_outs_ready_anchors_in),
.outs_valid (buffer0_outs_valid_anchors_out),
.rst (rst)
);

tehb #(.DATA_TYPE(32)) buffer1(
.clk (clk),
.ins (buffer0_outs_anchors_in),
.ins_ready (buffer0_outs_ready_anchors_out),
.ins_valid (buffer0_outs_valid_anchors_in),
.outs (buffer1_outs_anchors_out),
.outs_ready (buffer1_outs_ready_anchors_in),
.outs_valid (buffer1_outs_valid_anchors_out),
.rst (rst)
);

mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux0(
.clk (clk),
.index (fork4_outs_0_anchors_in),
.index_ready (fork4_outs_0_ready_anchors_out),
.index_valid (fork4_outs_0_valid_anchors_in),
.ins ({buffer1_outs_anchors_in, extsi5_outs_anchors_in}),
.ins_ready ({buffer1_outs_ready_anchors_out, extsi5_outs_ready_anchors_out}),
.ins_valid ({buffer1_outs_valid_anchors_in, extsi5_outs_valid_anchors_in}),
.outs (mux0_outs_anchors_out),
.outs_ready (mux0_outs_ready_anchors_in),
.outs_valid (mux0_outs_valid_anchors_out),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(32)) fork2(
.clk (clk),
.ins (mux0_outs_anchors_in),
.ins_ready (mux0_outs_ready_anchors_out),
.ins_valid (mux0_outs_valid_anchors_in),
.outs ({fork2_outs_1_anchors_out, fork2_outs_0_anchors_out}),
.outs_ready ({fork2_outs_1_ready_anchors_in, fork2_outs_0_ready_anchors_in}),
.outs_valid ({fork2_outs_1_valid_anchors_out, fork2_outs_0_valid_anchors_out}),
.rst (rst)
);

oehb #(.DATA_TYPE(32)) buffer2(
.clk (clk),
.ins (select0_result_anchors_in),
.ins_ready (select0_result_ready_anchors_out),
.ins_valid (select0_result_valid_anchors_in),
.outs (buffer2_outs_anchors_out),
.outs_ready (buffer2_outs_ready_anchors_in),
.outs_valid (buffer2_outs_valid_anchors_out),
.rst (rst)
);

tehb #(.DATA_TYPE(32)) buffer3(
.clk (clk),
.ins (buffer2_outs_anchors_in),
.ins_ready (buffer2_outs_ready_anchors_out),
.ins_valid (buffer2_outs_valid_anchors_in),
.outs (buffer3_outs_anchors_out),
.outs_ready (buffer3_outs_ready_anchors_in),
.outs_valid (buffer3_outs_valid_anchors_out),
.rst (rst)
);

mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux1(
.clk (clk),
.index (fork4_outs_1_anchors_in),
.index_ready (fork4_outs_1_ready_anchors_out),
.index_valid (fork4_outs_1_valid_anchors_in),
.ins ({buffer3_outs_anchors_in, extsi6_outs_anchors_in}),
.ins_ready ({buffer3_outs_ready_anchors_out, extsi6_outs_ready_anchors_out}),
.ins_valid ({buffer3_outs_valid_anchors_in, extsi6_outs_valid_anchors_in}),
.outs (mux1_outs_anchors_out),
.outs_ready (mux1_outs_ready_anchors_in),
.outs_valid (mux1_outs_valid_anchors_out),
.rst (rst)
);

oehb #(.DATA_TYPE(32)) buffer4(
.clk (clk),
.ins (cond_br1_trueOut_anchors_in),
.ins_ready (cond_br1_trueOut_ready_anchors_out),
.ins_valid (cond_br1_trueOut_valid_anchors_in),
.outs (buffer4_outs_anchors_out),
.outs_ready (buffer4_outs_ready_anchors_in),
.outs_valid (buffer4_outs_valid_anchors_out),
.rst (rst)
);

tehb #(.DATA_TYPE(32)) buffer5(
.clk (clk),
.ins (buffer4_outs_anchors_in),
.ins_ready (buffer4_outs_ready_anchors_out),
.ins_valid (buffer4_outs_valid_anchors_in),
.outs (buffer5_outs_anchors_out),
.outs_ready (buffer5_outs_ready_anchors_in),
.outs_valid (buffer5_outs_valid_anchors_out),
.rst (rst)
);

mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux2(
.clk (clk),
.index (fork4_outs_2_anchors_in),
.index_ready (fork4_outs_2_ready_anchors_out),
.index_valid (fork4_outs_2_valid_anchors_in),
.ins ({buffer5_outs_anchors_in, n}),
.ins_ready ({buffer5_outs_ready_anchors_out, n_ready}),
.ins_valid ({buffer5_outs_valid_anchors_in, n_valid}),
.outs (mux2_outs_anchors_out),
.outs_ready (mux2_outs_ready_anchors_in),
.outs_valid (mux2_outs_valid_anchors_out),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(32)) fork3(
.clk (clk),
.ins (mux2_outs_anchors_in),
.ins_ready (mux2_outs_ready_anchors_out),
.ins_valid (mux2_outs_valid_anchors_in),
.outs ({fork3_outs_1_anchors_out, fork3_outs_0_anchors_out}),
.outs_ready ({fork3_outs_1_ready_anchors_in, fork3_outs_0_ready_anchors_in}),
.outs_valid ({fork3_outs_1_valid_anchors_out, fork3_outs_0_valid_anchors_out}),
.rst (rst)
);

oehb_dataless buffer6(
.clk (clk),
.ins_ready (cond_br4_trueOut_ready_anchors_out),
.ins_valid (cond_br4_trueOut_valid_anchors_in),
.outs_ready (buffer6_outs_ready_anchors_in),
.outs_valid (buffer6_outs_valid_anchors_out),
.rst (rst)
);

tehb_dataless buffer7(
.clk (clk),
.ins_ready (buffer6_outs_ready_anchors_out),
.ins_valid (buffer6_outs_valid_anchors_in),
.outs_ready (buffer7_outs_ready_anchors_in),
.outs_valid (buffer7_outs_valid_anchors_out),
.rst (rst)
);

control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
.clk (clk),
.index (control_merge0_index_anchors_out),
.index_ready (control_merge0_index_ready_anchors_in),
.index_valid (control_merge0_index_valid_anchors_out),
.ins_ready ({buffer7_outs_ready_anchors_out, fork0_outs_2_ready_anchors_out}),
.ins_valid ({buffer7_outs_valid_anchors_in, fork0_outs_2_valid_anchors_in}),
.outs_ready (control_merge0_outs_ready_anchors_in),
.outs_valid (control_merge0_outs_valid_anchors_out),
.rst (rst)
);

fork_type #(.SIZE(3), .DATA_TYPE(1)) fork4(
.clk (clk),
.ins (control_merge0_index_anchors_in),
.ins_ready (control_merge0_index_ready_anchors_out),
.ins_valid (control_merge0_index_valid_anchors_in),
.outs ({fork4_outs_2_anchors_out, fork4_outs_1_anchors_out, fork4_outs_0_anchors_out}),
.outs_ready ({fork4_outs_2_ready_anchors_in, fork4_outs_1_ready_anchors_in, fork4_outs_0_ready_anchors_in}),
.outs_valid ({fork4_outs_2_valid_anchors_out, fork4_outs_1_valid_anchors_out, fork4_outs_0_valid_anchors_out}),
.rst (rst)
);

handshake_cmpi_0 #(.DATA_TYPE(32)) cmpi1(
.clk (clk),
.lhs (fork2_outs_1_anchors_in),
.lhs_ready (fork2_outs_1_ready_anchors_out),
.lhs_valid (fork2_outs_1_valid_anchors_in),
.result (cmpi1_result_anchors_out),
.result_ready (cmpi1_result_ready_anchors_in),
.result_valid (cmpi1_result_valid_anchors_out),
.rhs (fork3_outs_1_anchors_in),
.rhs_ready (fork3_outs_1_ready_anchors_out),
.rhs_valid (fork3_outs_1_valid_anchors_in),
.rst (rst)
);

fork_type #(.SIZE(4), .DATA_TYPE(1)) fork5(
.clk (clk),
.ins (cmpi1_result_anchors_in),
.ins_ready (cmpi1_result_ready_anchors_out),
.ins_valid (cmpi1_result_valid_anchors_in),
.outs ({fork5_outs_3_anchors_out, fork5_outs_2_anchors_out, fork5_outs_1_anchors_out, fork5_outs_0_anchors_out}),
.outs_ready ({fork5_outs_3_ready_anchors_in, fork5_outs_2_ready_anchors_in, fork5_outs_1_ready_anchors_in, fork5_outs_0_ready_anchors_in}),
.outs_valid ({fork5_outs_3_valid_anchors_out, fork5_outs_2_valid_anchors_out, fork5_outs_1_valid_anchors_out, fork5_outs_0_valid_anchors_out}),
.rst (rst)
);

cond_br #(.DATA_TYPE(32)) cond_br1(
.clk (clk),
.condition (fork5_outs_3_anchors_in),
.condition_ready (fork5_outs_3_ready_anchors_out),
.condition_valid (fork5_outs_3_valid_anchors_in),
.data (fork3_outs_0_anchors_in),
.data_ready (fork3_outs_0_ready_anchors_out),
.data_valid (fork3_outs_0_valid_anchors_in),
.falseOut (cond_br1_falseOut_anchors_out),
.falseOut_ready (cond_br1_falseOut_ready_anchors_in),
.falseOut_valid (cond_br1_falseOut_valid_anchors_out),
.rst (rst),
.trueOut (cond_br1_trueOut_anchors_out),
.trueOut_ready (cond_br1_trueOut_ready_anchors_in),
.trueOut_valid (cond_br1_trueOut_valid_anchors_out)
);

sink #(.DATA_TYPE(32)) sink0(
.clk (clk),
.ins (cond_br1_falseOut_anchors_in),
.ins_ready (cond_br1_falseOut_ready_anchors_out),
.ins_valid (cond_br1_falseOut_valid_anchors_in),
.rst (rst)
);

cond_br #(.DATA_TYPE(32)) cond_br2(
.clk (clk),
.condition (fork5_outs_2_anchors_in),
.condition_ready (fork5_outs_2_ready_anchors_out),
.condition_valid (fork5_outs_2_valid_anchors_in),
.data (fork2_outs_0_anchors_in),
.data_ready (fork2_outs_0_ready_anchors_out),
.data_valid (fork2_outs_0_valid_anchors_in),
.falseOut (cond_br2_falseOut_anchors_out),
.falseOut_ready (cond_br2_falseOut_ready_anchors_in),
.falseOut_valid (cond_br2_falseOut_valid_anchors_out),
.rst (rst),
.trueOut (cond_br2_trueOut_anchors_out),
.trueOut_ready (cond_br2_trueOut_ready_anchors_in),
.trueOut_valid (cond_br2_trueOut_valid_anchors_out)
);

sink #(.DATA_TYPE(32)) sink1(
.clk (clk),
.ins (cond_br2_falseOut_anchors_in),
.ins_ready (cond_br2_falseOut_ready_anchors_out),
.ins_valid (cond_br2_falseOut_valid_anchors_in),
.rst (rst)
);

cond_br #(.DATA_TYPE(32)) cond_br3(
.clk (clk),
.condition (fork5_outs_1_anchors_in),
.condition_ready (fork5_outs_1_ready_anchors_out),
.condition_valid (fork5_outs_1_valid_anchors_in),
.data (mux1_outs_anchors_in),
.data_ready (mux1_outs_ready_anchors_out),
.data_valid (mux1_outs_valid_anchors_in),
.falseOut (cond_br3_falseOut_anchors_out),
.falseOut_ready (cond_br3_falseOut_ready_anchors_in),
.falseOut_valid (cond_br3_falseOut_valid_anchors_out),
.rst (rst),
.trueOut (cond_br3_trueOut_anchors_out),
.trueOut_ready (cond_br3_trueOut_ready_anchors_in),
.trueOut_valid (cond_br3_trueOut_valid_anchors_out)
);

cond_br_dataless cond_br4(
.clk (clk),
.condition (fork5_outs_0_anchors_in),
.condition_ready (fork5_outs_0_ready_anchors_out),
.condition_valid (fork5_outs_0_valid_anchors_in),
.data_ready (control_merge0_outs_ready_anchors_out),
.data_valid (control_merge0_outs_valid_anchors_in),
.falseOut_ready (cond_br4_falseOut_ready_anchors_in),
.falseOut_valid (cond_br4_falseOut_valid_anchors_out),
.rst (rst),
.trueOut_ready (cond_br4_trueOut_ready_anchors_in),
.trueOut_valid (cond_br4_trueOut_valid_anchors_out)
);

fork_type #(.SIZE(2), .DATA_TYPE(32)) fork6(
.clk (clk),
.ins (cond_br2_trueOut_anchors_in),
.ins_ready (cond_br2_trueOut_ready_anchors_out),
.ins_valid (cond_br2_trueOut_valid_anchors_in),
.outs ({fork6_outs_1_anchors_out, fork6_outs_0_anchors_out}),
.outs_ready ({fork6_outs_1_ready_anchors_in, fork6_outs_0_ready_anchors_in}),
.outs_valid ({fork6_outs_1_valid_anchors_out, fork6_outs_0_valid_anchors_out}),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(32)) fork7(
.clk (clk),
.ins (cond_br3_trueOut_anchors_in),
.ins_ready (cond_br3_trueOut_ready_anchors_out),
.ins_valid (cond_br3_trueOut_valid_anchors_in),
.outs ({fork7_outs_1_anchors_out, fork7_outs_0_anchors_out}),
.outs_ready ({fork7_outs_1_ready_anchors_in, fork7_outs_0_ready_anchors_in}),
.outs_valid ({fork7_outs_1_valid_anchors_out, fork7_outs_0_valid_anchors_out}),
.rst (rst)
);

source source0(
.clk (clk),
.outs_ready (source0_outs_ready_anchors_in),
.outs_valid (source0_outs_valid_anchors_out),
.rst (rst)
);

handshake_constant_1 #(.DATA_WIDTH(2)) constant2(
.clk (clk),
.ctrl_ready (source0_outs_ready_anchors_out),
.ctrl_valid (source0_outs_valid_anchors_in),
.outs (constant2_outs_anchors_out),
.outs_ready (constant2_outs_ready_anchors_in),
.outs_valid (constant2_outs_valid_anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi2(
.clk (clk),
.ins (constant2_outs_anchors_in),
.ins_ready (constant2_outs_ready_anchors_out),
.ins_valid (constant2_outs_valid_anchors_in),
.outs (extsi2_outs_anchors_out),
.outs_ready (extsi2_outs_ready_anchors_in),
.outs_valid (extsi2_outs_valid_anchors_out),
.rst (rst)
);

source source1(
.clk (clk),
.outs_ready (source1_outs_ready_anchors_in),
.outs_valid (source1_outs_valid_anchors_out),
.rst (rst)
);

handshake_constant_2 #(.DATA_WIDTH(5)) constant4(
.clk (clk),
.ctrl_ready (source1_outs_ready_anchors_out),
.ctrl_valid (source1_outs_valid_anchors_in),
.outs (constant4_outs_anchors_out),
.outs_ready (constant4_outs_ready_anchors_in),
.outs_valid (constant4_outs_valid_anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi3(
.clk (clk),
.ins (constant4_outs_anchors_in),
.ins_ready (constant4_outs_ready_anchors_out),
.ins_valid (constant4_outs_valid_anchors_in),
.outs (extsi3_outs_anchors_out),
.outs_ready (extsi3_outs_ready_anchors_in),
.outs_valid (extsi3_outs_valid_anchors_out),
.rst (rst)
);

source source2(
.clk (clk),
.outs_ready (source2_outs_ready_anchors_in),
.outs_valid (source2_outs_valid_anchors_out),
.rst (rst)
);

handshake_constant_3 #(.DATA_WIDTH(3)) constant8(
.clk (clk),
.ctrl_ready (source2_outs_ready_anchors_out),
.ctrl_valid (source2_outs_valid_anchors_in),
.outs (constant8_outs_anchors_out),
.outs_ready (constant8_outs_ready_anchors_in),
.outs_valid (constant8_outs_valid_anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi4(
.clk (clk),
.ins (constant8_outs_anchors_in),
.ins_ready (constant8_outs_ready_anchors_out),
.ins_valid (constant8_outs_valid_anchors_in),
.outs (extsi4_outs_anchors_out),
.outs_ready (extsi4_outs_ready_anchors_in),
.outs_valid (extsi4_outs_valid_anchors_out),
.rst (rst)
);

mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load0(
.addrIn (fork6_outs_1_anchors_in),
.addrIn_ready (fork6_outs_1_ready_anchors_out),
.addrIn_valid (fork6_outs_1_valid_anchors_in),
.addrOut (mc_load0_addrOut),
.addrOut_ready (mc_load0_addrOut_ready),
.addrOut_valid (mc_load0_addrOut_valid),
.clk (clk),
.dataFromMem (mem_controller0_ldData_0_anchors_in),
.dataFromMem_ready (mem_controller0_ldData_0_ready_anchors_out),
.dataFromMem_valid (mem_controller0_ldData_0_valid_anchors_in),
.dataOut (mc_load0_dataOut),
.dataOut_ready (mc_load0_dataOut_ready),
.dataOut_valid (mc_load0_dataOut_valid),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(32)) fork8(
.clk (clk),
.ins (mc_load0_dataOut),
.ins_ready (mc_load0_dataOut_ready),
.ins_valid (mc_load0_dataOut_valid),
.outs ({fork8_outs_1_anchors_out, fork8_outs_0_anchors_out}),
.outs_ready ({fork8_outs_1_ready_anchors_in, fork8_outs_0_ready_anchors_in}),
.outs_valid ({fork8_outs_1_valid_anchors_out, fork8_outs_0_valid_anchors_out}),
.rst (rst)
);

shli #(.DATA_TYPE(32)) shli0(
.clk (clk),
.lhs (fork8_outs_1_anchors_in),
.lhs_ready (fork8_outs_1_ready_anchors_out),
.lhs_valid (fork8_outs_1_valid_anchors_in),
.result (shli0_result_anchors_out),
.result_ready (shli0_result_ready_anchors_in),
.result_valid (shli0_result_valid_anchors_out),
.rhs (extsi4_outs_anchors_in),
.rhs_ready (extsi4_outs_ready_anchors_out),
.rhs_valid (extsi4_outs_valid_anchors_in),
.rst (rst)
);

addi #(.DATA_TYPE(32)) addi2(
.clk (clk),
.lhs (fork8_outs_0_anchors_in),
.lhs_ready (fork8_outs_0_ready_anchors_out),
.lhs_valid (fork8_outs_0_valid_anchors_in),
.result (addi2_result_anchors_out),
.result_ready (addi2_result_ready_anchors_in),
.result_valid (addi2_result_valid_anchors_out),
.rhs (shli0_result_anchors_in),
.rhs_ready (shli0_result_ready_anchors_out),
.rhs_valid (shli0_result_valid_anchors_in),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(32)) fork9(
.clk (clk),
.ins (addi2_result_anchors_in),
.ins_ready (addi2_result_ready_anchors_out),
.ins_valid (addi2_result_valid_anchors_in),
.outs ({fork9_outs_1_anchors_out, fork9_outs_0_anchors_out}),
.outs_ready ({fork9_outs_1_ready_anchors_in, fork9_outs_0_ready_anchors_in}),
.outs_valid ({fork9_outs_1_valid_anchors_out, fork9_outs_0_valid_anchors_out}),
.rst (rst)
);

handshake_cmpi_1 #(.DATA_TYPE(32)) cmpi0(
.clk (clk),
.lhs (fork9_outs_1_anchors_in),
.lhs_ready (fork9_outs_1_ready_anchors_out),
.lhs_valid (fork9_outs_1_valid_anchors_in),
.result (cmpi0_result_anchors_out),
.result_ready (cmpi0_result_ready_anchors_in),
.result_valid (cmpi0_result_valid_anchors_out),
.rhs (extsi3_outs_anchors_in),
.rhs_ready (extsi3_outs_ready_anchors_out),
.rhs_valid (extsi3_outs_valid_anchors_in),
.rst (rst)
);

addi #(.DATA_TYPE(32)) addi1(
.clk (clk),
.lhs (fork7_outs_1_anchors_in),
.lhs_ready (fork7_outs_1_ready_anchors_out),
.lhs_valid (fork7_outs_1_valid_anchors_in),
.result (addi1_result_anchors_out),
.result_ready (addi1_result_ready_anchors_in),
.result_valid (addi1_result_valid_anchors_out),
.rhs (fork9_outs_0_anchors_in),
.rhs_ready (fork9_outs_0_ready_anchors_out),
.rhs_valid (fork9_outs_0_valid_anchors_in),
.rst (rst)
);

selector #(.DATA_TYPE(32)) select0(
.clk (clk),
.condition (cmpi0_result_anchors_in),
.condition_ready (cmpi0_result_ready_anchors_out),
.condition_valid (cmpi0_result_valid_anchors_in),
.falseValue (fork7_outs_0),
.falseValue_ready (fork7_outs_0_ready),
.falseValue_valid (fork7_outs_0_valid),
.result (select0_result_anchors_out),
.result_ready (select0_result_ready_anchors_in),
.result_valid (select0_result_valid_anchors_out),
.rst (rst),
.trueValue (addi1_result),
.trueValue_ready (addi1_result_ready),
.trueValue_valid (addi1_result_valid)
);

addi #(.DATA_TYPE(32)) addi0(
.clk (clk),
.lhs (fork6_outs_0_anchors_in),
.lhs_ready (fork6_outs_0_ready_anchors_out),
.lhs_valid (fork6_outs_0_valid_anchors_in),
.result (addi0_result_anchors_out),
.result_ready (addi0_result_ready_anchors_in),
.result_valid (addi0_result_valid_anchors_out),
.rhs (extsi2_outs_anchors_in),
.rhs_ready (extsi2_outs_ready_anchors_out),
.rhs_valid (extsi2_outs_valid_anchors_in),
.rst (rst)
);

endmodule
