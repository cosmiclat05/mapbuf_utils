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
  output [31:0] a_storeData
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
  wire [0:0] constant0_outs;
  wire constant0_outs_valid;
  wire constant0_outs_ready;
  wire [0:0] fork1_outs_0;
  wire fork1_outs_0_valid;
  wire fork1_outs_0_ready;
  wire [0:0] fork1_outs_1;
  wire fork1_outs_1_valid;
  wire fork1_outs_1_ready;
  wire [31:0] extsi5_outs;
  wire extsi5_outs_valid;
  wire extsi5_outs_ready;
  wire [31:0] extsi6_outs;
  wire extsi6_outs_valid;
  wire extsi6_outs_ready;
  wire [31:0] buffer0_outs;
  wire buffer0_outs_valid;
  wire buffer0_outs_ready;
  wire [31:0] buffer1_outs;
  wire buffer1_outs_valid;
  wire buffer1_outs_ready;
  wire [31:0] mux0_outs;
  wire mux0_outs_valid;
  wire mux0_outs_ready;
  wire [31:0] fork2_outs_0;
  wire fork2_outs_0_valid;
  wire fork2_outs_0_ready;
  wire [31:0] fork2_outs_1;
  wire fork2_outs_1_valid;
  wire fork2_outs_1_ready;
  wire [31:0] buffer2_outs;
  wire buffer2_outs_valid;
  wire buffer2_outs_ready;
  wire [31:0] buffer3_outs;
  wire buffer3_outs_valid;
  wire buffer3_outs_ready;
  wire [31:0] mux1_outs;
  wire mux1_outs_valid;
  wire mux1_outs_ready;
  wire [31:0] buffer4_outs;
  wire buffer4_outs_valid;
  wire buffer4_outs_ready;
  wire [31:0] buffer5_outs;
  wire buffer5_outs_valid;
  wire buffer5_outs_ready;
  wire [31:0] mux2_outs;
  wire mux2_outs_valid;
  wire mux2_outs_ready;
  wire [31:0] fork3_outs_0;
  wire fork3_outs_0_valid;
  wire fork3_outs_0_ready;
  wire [31:0] fork3_outs_1;
  wire fork3_outs_1_valid;
  wire fork3_outs_1_ready;
  wire buffer6_outs_valid;
  wire buffer6_outs_ready;
  wire buffer7_outs_valid;
  wire buffer7_outs_ready;
  wire control_merge0_outs_valid;
  wire control_merge0_outs_ready;
  wire [0:0] control_merge0_index;
  wire control_merge0_index_valid;
  wire control_merge0_index_ready;
  wire [0:0] fork4_outs_0;
  wire fork4_outs_0_valid;
  wire fork4_outs_0_ready;
  wire [0:0] fork4_outs_1;
  wire fork4_outs_1_valid;
  wire fork4_outs_1_ready;
  wire [0:0] fork4_outs_2;
  wire fork4_outs_2_valid;
  wire fork4_outs_2_ready;
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
  wire [0:0] fork5_outs_3;
  wire fork5_outs_3_valid;
  wire fork5_outs_3_ready;
  wire [31:0] cond_br1_trueOut;
  wire cond_br1_trueOut_valid;
  wire cond_br1_trueOut_ready;
  wire [31:0] cond_br1_falseOut;
  wire cond_br1_falseOut_valid;
  wire cond_br1_falseOut_ready;
  wire [31:0] cond_br2_trueOut;
  wire cond_br2_trueOut_valid;
  wire cond_br2_trueOut_ready;
  wire [31:0] cond_br2_falseOut;
  wire cond_br2_falseOut_valid;
  wire cond_br2_falseOut_ready;
  wire [31:0] cond_br3_trueOut;
  wire cond_br3_trueOut_valid;
  wire cond_br3_trueOut_ready;
  wire [31:0] cond_br3_falseOut;
  wire cond_br3_falseOut_valid;
  wire cond_br3_falseOut_ready;
  wire cond_br4_trueOut_valid;
  wire cond_br4_trueOut_ready;
  wire cond_br4_falseOut_valid;
  wire cond_br4_falseOut_ready;
  wire [31:0] fork6_outs_0;
  wire fork6_outs_0_valid;
  wire fork6_outs_0_ready;
  wire [31:0] fork6_outs_1;
  wire fork6_outs_1_valid;
  wire fork6_outs_1_ready;
  wire [31:0] fork7_outs_0;
  wire fork7_outs_0_valid;
  wire fork7_outs_0_ready;
  wire [31:0] fork7_outs_1;
  wire fork7_outs_1_valid;
  wire fork7_outs_1_ready;
  wire source0_outs_valid;
  wire source0_outs_ready;
  wire [1:0] constant2_outs;
  wire constant2_outs_valid;
  wire constant2_outs_ready;
  wire [31:0] extsi2_outs;
  wire extsi2_outs_valid;
  wire extsi2_outs_ready;
  wire source1_outs_valid;
  wire source1_outs_ready;
  wire [4:0] constant4_outs;
  wire constant4_outs_valid;
  wire constant4_outs_ready;
  wire [31:0] extsi3_outs;
  wire extsi3_outs_valid;
  wire extsi3_outs_ready;
  wire source2_outs_valid;
  wire source2_outs_ready;
  wire [2:0] constant8_outs;
  wire constant8_outs_valid;
  wire constant8_outs_ready;
  wire [31:0] extsi4_outs;
  wire extsi4_outs_valid;
  wire extsi4_outs_ready;
  wire [31:0] mc_load0_addrOut;
  wire mc_load0_addrOut_valid;
  wire mc_load0_addrOut_ready;
  wire [31:0] mc_load0_dataOut;
  wire mc_load0_dataOut_valid;
  wire mc_load0_dataOut_ready;
  wire [31:0] fork8_outs_0;
  wire fork8_outs_0_valid;
  wire fork8_outs_0_ready;
  wire [31:0] fork8_outs_1;
  wire fork8_outs_1_valid;
  wire fork8_outs_1_ready;
  wire [31:0] shli0_result;
  wire shli0_result_valid;
  wire shli0_result_ready;
  wire [31:0] addi2_result;
  wire addi2_result_valid;
  wire addi2_result_ready;
  wire [31:0] fork9_outs_0;
  wire fork9_outs_0_valid;
  wire fork9_outs_0_ready;
  wire [31:0] fork9_outs_1;
  wire fork9_outs_1_valid;
  wire fork9_outs_1_ready;
  wire [0:0] cmpi0_result;
  wire cmpi0_result_valid;
  wire cmpi0_result_ready;
  wire [31:0] addi1_result;
  wire addi1_result_valid;
  wire addi1_result_ready;
  wire [31:0] select0_result;
  wire select0_result_valid;
  wire select0_result_ready;
  wire [31:0] addi0_result;
  wire addi0_result_valid;
  wire addi0_result_ready;

  // module outputs
  assign out0 = cond_br3_falseOut;
  assign out0_valid = cond_br3_falseOut_valid;
  assign cond_br3_falseOut_ready = out0_ready;
  assign a_end_valid = mem_controller0_memEnd_valid;
  assign mem_controller0_memEnd_ready = a_end_ready;
  assign end_valid = fork0_outs_1_valid;
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
    .outs_ready ({fork0_outs_2_ready, fork0_outs_1_ready, fork0_outs_0_ready}),
    .outs_valid ({fork0_outs_2_valid, fork0_outs_1_valid, fork0_outs_0_valid}),
    .rst (rst)
  );

  mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(32), .ADDR_TYPE(32)) mem_controller0(
    .clk (clk),
    .ctrlEnd_ready (cond_br4_falseOut_ready),
    .ctrlEnd_valid (cond_br4_falseOut_valid),
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

  extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(32)) extsi5(
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

  oehb #(.DATA_TYPE(32)) buffer0(
    .clk (clk),
    .ins (addi0_result),
    .ins_ready (addi0_result_ready),
    .ins_valid (addi0_result_valid),
    .outs (buffer0_outs),
    .outs_ready (buffer0_outs_ready),
    .outs_valid (buffer0_outs_valid),
    .rst (rst)
  );

  tehb #(.DATA_TYPE(32)) buffer1(
    .clk (clk),
    .ins (buffer0_outs),
    .ins_ready (buffer0_outs_ready),
    .ins_valid (buffer0_outs_valid),
    .outs (buffer1_outs),
    .outs_ready (buffer1_outs_ready),
    .outs_valid (buffer1_outs_valid),
    .rst (rst)
  );

  mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux0(
    .clk (clk),
    .index (fork4_outs_0),
    .index_ready (fork4_outs_0_ready),
    .index_valid (fork4_outs_0_valid),
    .ins ({buffer1_outs, extsi5_outs}),
    .ins_ready ({buffer1_outs_ready, extsi5_outs_ready}),
    .ins_valid ({buffer1_outs_valid, extsi5_outs_valid}),
    .outs (mux0_outs),
    .outs_ready (mux0_outs_ready),
    .outs_valid (mux0_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork2(
    .clk (clk),
    .ins (mux0_outs),
    .ins_ready (mux0_outs_ready),
    .ins_valid (mux0_outs_valid),
    .outs ({fork2_outs_1, fork2_outs_0}),
    .outs_ready ({fork2_outs_1_ready, fork2_outs_0_ready}),
    .outs_valid ({fork2_outs_1_valid, fork2_outs_0_valid}),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(32)) buffer2(
    .clk (clk),
    .ins (select0_result),
    .ins_ready (select0_result_ready),
    .ins_valid (select0_result_valid),
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
    .index (fork4_outs_1),
    .index_ready (fork4_outs_1_ready),
    .index_valid (fork4_outs_1_valid),
    .ins ({buffer3_outs, extsi6_outs}),
    .ins_ready ({buffer3_outs_ready, extsi6_outs_ready}),
    .ins_valid ({buffer3_outs_valid, extsi6_outs_valid}),
    .outs (mux1_outs),
    .outs_ready (mux1_outs_ready),
    .outs_valid (mux1_outs_valid),
    .rst (rst)
  );

  oehb #(.DATA_TYPE(32)) buffer4(
    .clk (clk),
    .ins (cond_br1_trueOut),
    .ins_ready (cond_br1_trueOut_ready),
    .ins_valid (cond_br1_trueOut_valid),
    .outs (buffer4_outs),
    .outs_ready (buffer4_outs_ready),
    .outs_valid (buffer4_outs_valid),
    .rst (rst)
  );

  tehb #(.DATA_TYPE(32)) buffer5(
    .clk (clk),
    .ins (buffer4_outs),
    .ins_ready (buffer4_outs_ready),
    .ins_valid (buffer4_outs_valid),
    .outs (buffer5_outs),
    .outs_ready (buffer5_outs_ready),
    .outs_valid (buffer5_outs_valid),
    .rst (rst)
  );

  mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux2(
    .clk (clk),
    .index (fork4_outs_2),
    .index_ready (fork4_outs_2_ready),
    .index_valid (fork4_outs_2_valid),
    .ins ({buffer5_outs, n}),
    .ins_ready ({buffer5_outs_ready, n_ready}),
    .ins_valid ({buffer5_outs_valid, n_valid}),
    .outs (mux2_outs),
    .outs_ready (mux2_outs_ready),
    .outs_valid (mux2_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork3(
    .clk (clk),
    .ins (mux2_outs),
    .ins_ready (mux2_outs_ready),
    .ins_valid (mux2_outs_valid),
    .outs ({fork3_outs_1, fork3_outs_0}),
    .outs_ready ({fork3_outs_1_ready, fork3_outs_0_ready}),
    .outs_valid ({fork3_outs_1_valid, fork3_outs_0_valid}),
    .rst (rst)
  );

  oehb_dataless buffer6(
    .clk (clk),
    .ins_ready (cond_br4_trueOut_ready),
    .ins_valid (cond_br4_trueOut_valid),
    .outs_ready (buffer6_outs_ready),
    .outs_valid (buffer6_outs_valid),
    .rst (rst)
  );

  tehb_dataless buffer7(
    .clk (clk),
    .ins_ready (buffer6_outs_ready),
    .ins_valid (buffer6_outs_valid),
    .outs_ready (buffer7_outs_ready),
    .outs_valid (buffer7_outs_valid),
    .rst (rst)
  );

  control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
    .clk (clk),
    .index (control_merge0_index),
    .index_ready (control_merge0_index_ready),
    .index_valid (control_merge0_index_valid),
    .ins_ready ({buffer7_outs_ready, fork0_outs_2_ready}),
    .ins_valid ({buffer7_outs_valid, fork0_outs_2_valid}),
    .outs_ready (control_merge0_outs_ready),
    .outs_valid (control_merge0_outs_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(3), .DATA_TYPE(1)) fork4(
    .clk (clk),
    .ins (control_merge0_index),
    .ins_ready (control_merge0_index_ready),
    .ins_valid (control_merge0_index_valid),
    .outs ({fork4_outs_2, fork4_outs_1, fork4_outs_0}),
    .outs_ready ({fork4_outs_2_ready, fork4_outs_1_ready, fork4_outs_0_ready}),
    .outs_valid ({fork4_outs_2_valid, fork4_outs_1_valid, fork4_outs_0_valid}),
    .rst (rst)
  );

  handshake_cmpi_0 #(.DATA_TYPE(32)) cmpi1(
    .clk (clk),
    .lhs (fork2_outs_1),
    .lhs_ready (fork2_outs_1_ready),
    .lhs_valid (fork2_outs_1_valid),
    .result (cmpi1_result),
    .result_ready (cmpi1_result_ready),
    .result_valid (cmpi1_result_valid),
    .rhs (fork3_outs_1),
    .rhs_ready (fork3_outs_1_ready),
    .rhs_valid (fork3_outs_1_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(4), .DATA_TYPE(1)) fork5(
    .clk (clk),
    .ins (cmpi1_result),
    .ins_ready (cmpi1_result_ready),
    .ins_valid (cmpi1_result_valid),
    .outs ({fork5_outs_3, fork5_outs_2, fork5_outs_1, fork5_outs_0}),
    .outs_ready ({fork5_outs_3_ready, fork5_outs_2_ready, fork5_outs_1_ready, fork5_outs_0_ready}),
    .outs_valid ({fork5_outs_3_valid, fork5_outs_2_valid, fork5_outs_1_valid, fork5_outs_0_valid}),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br1(
    .clk (clk),
    .condition (fork5_outs_3),
    .condition_ready (fork5_outs_3_ready),
    .condition_valid (fork5_outs_3_valid),
    .data (fork3_outs_0),
    .data_ready (fork3_outs_0_ready),
    .data_valid (fork3_outs_0_valid),
    .falseOut (cond_br1_falseOut),
    .falseOut_ready (cond_br1_falseOut_ready),
    .falseOut_valid (cond_br1_falseOut_valid),
    .rst (rst),
    .trueOut (cond_br1_trueOut),
    .trueOut_ready (cond_br1_trueOut_ready),
    .trueOut_valid (cond_br1_trueOut_valid)
  );

  sink #(.DATA_TYPE(32)) sink0(
    .clk (clk),
    .ins (cond_br1_falseOut),
    .ins_ready (cond_br1_falseOut_ready),
    .ins_valid (cond_br1_falseOut_valid),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br2(
    .clk (clk),
    .condition (fork5_outs_2),
    .condition_ready (fork5_outs_2_ready),
    .condition_valid (fork5_outs_2_valid),
    .data (fork2_outs_0),
    .data_ready (fork2_outs_0_ready),
    .data_valid (fork2_outs_0_valid),
    .falseOut (cond_br2_falseOut),
    .falseOut_ready (cond_br2_falseOut_ready),
    .falseOut_valid (cond_br2_falseOut_valid),
    .rst (rst),
    .trueOut (cond_br2_trueOut),
    .trueOut_ready (cond_br2_trueOut_ready),
    .trueOut_valid (cond_br2_trueOut_valid)
  );

  sink #(.DATA_TYPE(32)) sink1(
    .clk (clk),
    .ins (cond_br2_falseOut),
    .ins_ready (cond_br2_falseOut_ready),
    .ins_valid (cond_br2_falseOut_valid),
    .rst (rst)
  );

  cond_br #(.DATA_TYPE(32)) cond_br3(
    .clk (clk),
    .condition (fork5_outs_1),
    .condition_ready (fork5_outs_1_ready),
    .condition_valid (fork5_outs_1_valid),
    .data (mux1_outs),
    .data_ready (mux1_outs_ready),
    .data_valid (mux1_outs_valid),
    .falseOut (cond_br3_falseOut),
    .falseOut_ready (cond_br3_falseOut_ready),
    .falseOut_valid (cond_br3_falseOut_valid),
    .rst (rst),
    .trueOut (cond_br3_trueOut),
    .trueOut_ready (cond_br3_trueOut_ready),
    .trueOut_valid (cond_br3_trueOut_valid)
  );

  cond_br_dataless cond_br4(
    .clk (clk),
    .condition (fork5_outs_0),
    .condition_ready (fork5_outs_0_ready),
    .condition_valid (fork5_outs_0_valid),
    .data_ready (control_merge0_outs_ready),
    .data_valid (control_merge0_outs_valid),
    .falseOut_ready (cond_br4_falseOut_ready),
    .falseOut_valid (cond_br4_falseOut_valid),
    .rst (rst),
    .trueOut_ready (cond_br4_trueOut_ready),
    .trueOut_valid (cond_br4_trueOut_valid)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork6(
    .clk (clk),
    .ins (cond_br2_trueOut),
    .ins_ready (cond_br2_trueOut_ready),
    .ins_valid (cond_br2_trueOut_valid),
    .outs ({fork6_outs_1, fork6_outs_0}),
    .outs_ready ({fork6_outs_1_ready, fork6_outs_0_ready}),
    .outs_valid ({fork6_outs_1_valid, fork6_outs_0_valid}),
    .rst (rst)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork7(
    .clk (clk),
    .ins (cond_br3_trueOut),
    .ins_ready (cond_br3_trueOut_ready),
    .ins_valid (cond_br3_trueOut_valid),
    .outs ({fork7_outs_1, fork7_outs_0}),
    .outs_ready ({fork7_outs_1_ready, fork7_outs_0_ready}),
    .outs_valid ({fork7_outs_1_valid, fork7_outs_0_valid}),
    .rst (rst)
  );

  source source0(
    .clk (clk),
    .outs_ready (source0_outs_ready),
    .outs_valid (source0_outs_valid),
    .rst (rst)
  );

  handshake_constant_1 #(.DATA_WIDTH(2)) constant2(
    .clk (clk),
    .ctrl_ready (source0_outs_ready),
    .ctrl_valid (source0_outs_valid),
    .outs (constant2_outs),
    .outs_ready (constant2_outs_ready),
    .outs_valid (constant2_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(32)) extsi2(
    .clk (clk),
    .ins (constant2_outs),
    .ins_ready (constant2_outs_ready),
    .ins_valid (constant2_outs_valid),
    .outs (extsi2_outs),
    .outs_ready (extsi2_outs_ready),
    .outs_valid (extsi2_outs_valid),
    .rst (rst)
  );

  source source1(
    .clk (clk),
    .outs_ready (source1_outs_ready),
    .outs_valid (source1_outs_valid),
    .rst (rst)
  );

  handshake_constant_2 #(.DATA_WIDTH(5)) constant4(
    .clk (clk),
    .ctrl_ready (source1_outs_ready),
    .ctrl_valid (source1_outs_valid),
    .outs (constant4_outs),
    .outs_ready (constant4_outs_ready),
    .outs_valid (constant4_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(5), .OUTPUT_TYPE(32)) extsi3(
    .clk (clk),
    .ins (constant4_outs),
    .ins_ready (constant4_outs_ready),
    .ins_valid (constant4_outs_valid),
    .outs (extsi3_outs),
    .outs_ready (extsi3_outs_ready),
    .outs_valid (extsi3_outs_valid),
    .rst (rst)
  );

  source source2(
    .clk (clk),
    .outs_ready (source2_outs_ready),
    .outs_valid (source2_outs_valid),
    .rst (rst)
  );

  handshake_constant_3 #(.DATA_WIDTH(3)) constant8(
    .clk (clk),
    .ctrl_ready (source2_outs_ready),
    .ctrl_valid (source2_outs_valid),
    .outs (constant8_outs),
    .outs_ready (constant8_outs_ready),
    .outs_valid (constant8_outs_valid),
    .rst (rst)
  );

  extsi #(.INPUT_TYPE(3), .OUTPUT_TYPE(32)) extsi4(
    .clk (clk),
    .ins (constant8_outs),
    .ins_ready (constant8_outs_ready),
    .ins_valid (constant8_outs_valid),
    .outs (extsi4_outs),
    .outs_ready (extsi4_outs_ready),
    .outs_valid (extsi4_outs_valid),
    .rst (rst)
  );

  mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load0(
    .addrIn (fork6_outs_1),
    .addrIn_ready (fork6_outs_1_ready),
    .addrIn_valid (fork6_outs_1_valid),
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

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork8(
    .clk (clk),
    .ins (mc_load0_dataOut),
    .ins_ready (mc_load0_dataOut_ready),
    .ins_valid (mc_load0_dataOut_valid),
    .outs ({fork8_outs_1, fork8_outs_0}),
    .outs_ready ({fork8_outs_1_ready, fork8_outs_0_ready}),
    .outs_valid ({fork8_outs_1_valid, fork8_outs_0_valid}),
    .rst (rst)
  );

  shli #(.DATA_TYPE(32)) shli0(
    .clk (clk),
    .lhs (fork8_outs_1),
    .lhs_ready (fork8_outs_1_ready),
    .lhs_valid (fork8_outs_1_valid),
    .result (shli0_result),
    .result_ready (shli0_result_ready),
    .result_valid (shli0_result_valid),
    .rhs (extsi4_outs),
    .rhs_ready (extsi4_outs_ready),
    .rhs_valid (extsi4_outs_valid),
    .rst (rst)
  );

  addi #(.DATA_TYPE(32)) addi2(
    .clk (clk),
    .lhs (fork8_outs_0),
    .lhs_ready (fork8_outs_0_ready),
    .lhs_valid (fork8_outs_0_valid),
    .result (addi2_result),
    .result_ready (addi2_result_ready),
    .result_valid (addi2_result_valid),
    .rhs (shli0_result),
    .rhs_ready (shli0_result_ready),
    .rhs_valid (shli0_result_valid),
    .rst (rst)
  );

  fork_type #(.SIZE(2), .DATA_TYPE(32)) fork9(
    .clk (clk),
    .ins (addi2_result),
    .ins_ready (addi2_result_ready),
    .ins_valid (addi2_result_valid),
    .outs ({fork9_outs_1, fork9_outs_0}),
    .outs_ready ({fork9_outs_1_ready, fork9_outs_0_ready}),
    .outs_valid ({fork9_outs_1_valid, fork9_outs_0_valid}),
    .rst (rst)
  );

  handshake_cmpi_1 #(.DATA_TYPE(32)) cmpi0(
    .clk (clk),
    .lhs (fork9_outs_1),
    .lhs_ready (fork9_outs_1_ready),
    .lhs_valid (fork9_outs_1_valid),
    .result (cmpi0_result),
    .result_ready (cmpi0_result_ready),
    .result_valid (cmpi0_result_valid),
    .rhs (extsi3_outs),
    .rhs_ready (extsi3_outs_ready),
    .rhs_valid (extsi3_outs_valid),
    .rst (rst)
  );

  addi #(.DATA_TYPE(32)) addi1(
    .clk (clk),
    .lhs (fork7_outs_1),
    .lhs_ready (fork7_outs_1_ready),
    .lhs_valid (fork7_outs_1_valid),
    .result (addi1_result),
    .result_ready (addi1_result_ready),
    .result_valid (addi1_result_valid),
    .rhs (fork9_outs_0),
    .rhs_ready (fork9_outs_0_ready),
    .rhs_valid (fork9_outs_0_valid),
    .rst (rst)
  );

  selector #(.DATA_TYPE(32)) select0(
    .clk (clk),
    .condition (cmpi0_result),
    .condition_ready (cmpi0_result_ready),
    .condition_valid (cmpi0_result_valid),
    .falseValue (fork7_outs_0),
    .falseValue_ready (fork7_outs_0_ready),
    .falseValue_valid (fork7_outs_0_valid),
    .result (select0_result),
    .result_ready (select0_result_ready),
    .result_valid (select0_result_valid),
    .rst (rst),
    .trueValue (addi1_result),
    .trueValue_ready (addi1_result_ready),
    .trueValue_valid (addi1_result_valid)
  );

  addi #(.DATA_TYPE(32)) addi0(
    .clk (clk),
    .lhs (fork6_outs_0),
    .lhs_ready (fork6_outs_0_ready),
    .lhs_valid (fork6_outs_0_valid),
    .result (addi0_result),
    .result_ready (addi0_result_ready),
    .result_valid (addi0_result_valid),
    .rhs (extsi2_outs),
    .rhs_ready (extsi2_outs_ready),
    .rhs_valid (extsi2_outs_valid),
    .rst (rst)
  );

endmodule
