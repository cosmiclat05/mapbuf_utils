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
  input  validPathInfork0_outs_0_valid__anchors_in,
  input  readyPathInfork0_outs_0_ready__anchors_in,
  input  validPathInfork0_outs_1_valid__anchors_in,
  input  readyPathInfork0_outs_1_ready__anchors_in,
  input  validPathInfork0_outs_2_valid__anchors_in,
  input  readyPathInfork0_outs_2_ready__anchors_in,
  input [31:0] dataPathInmem_controller0_ldData_0__data_anchors_in,
  input  validPathInmem_controller0_ldData_0_valid__anchors_in,
  input  readyPathInmem_controller0_ldData_0_ready__anchors_in,
  input  validPathInmem_controller0_memEnd_valid__anchors_in,
  input  readyPathInmem_controller0_memEnd_ready__anchors_in,
  input [31:0] dataPathInmem_controller1_ldData_0__data_anchors_in,
  input  validPathInmem_controller1_ldData_0_valid__anchors_in,
  input  readyPathInmem_controller1_ldData_0_ready__anchors_in,
  input  validPathInmem_controller1_memEnd_valid__anchors_in,
  input  readyPathInmem_controller1_memEnd_ready__anchors_in,
  input  dataPathInconstant0_outs__data_anchors_in,
  input  validPathInconstant0_outs_valid__anchors_in,
  input  readyPathInconstant0_outs_ready__anchors_in,
  input  dataPathInfork1_outs_0__data_anchors_in,
  input  validPathInfork1_outs_0_valid__anchors_in,
  input  readyPathInfork1_outs_0_ready__anchors_in,
  input  dataPathInfork1_outs_1__data_anchors_in,
  input  validPathInfork1_outs_1_valid__anchors_in,
  input  readyPathInfork1_outs_1_ready__anchors_in,
  input [10:0] dataPathInextsi5_outs__data_anchors_in,
  input  validPathInextsi5_outs_valid__anchors_in,
  input  readyPathInextsi5_outs_ready__anchors_in,
  input [31:0] dataPathInextsi6_outs__data_anchors_in,
  input  validPathInextsi6_outs_valid__anchors_in,
  input  readyPathInextsi6_outs_ready__anchors_in,
  input [10:0] dataPathInbuffer0_outs__data_anchors_in,
  input  validPathInbuffer0_outs_valid__anchors_in,
  input  readyPathInbuffer0_outs_ready__anchors_in,
  input [10:0] dataPathInbuffer1_outs__data_anchors_in,
  input  validPathInbuffer1_outs_valid__anchors_in,
  input  readyPathInbuffer1_outs_ready__anchors_in,
  input [10:0] dataPathInmux2_outs__data_anchors_in,
  input  validPathInmux2_outs_valid__anchors_in,
  input  readyPathInmux2_outs_ready__anchors_in,
  input [10:0] dataPathInfork2_outs_0__data_anchors_in,
  input  validPathInfork2_outs_0_valid__anchors_in,
  input  readyPathInfork2_outs_0_ready__anchors_in,
  input [10:0] dataPathInfork2_outs_1__data_anchors_in,
  input  validPathInfork2_outs_1_valid__anchors_in,
  input  readyPathInfork2_outs_1_ready__anchors_in,
  input [10:0] dataPathInfork2_outs_2__data_anchors_in,
  input  validPathInfork2_outs_2_valid__anchors_in,
  input  readyPathInfork2_outs_2_ready__anchors_in,
  input [11:0] dataPathInextsi7_outs__data_anchors_in,
  input  validPathInextsi7_outs_valid__anchors_in,
  input  readyPathInextsi7_outs_ready__anchors_in,
  input [11:0] dataPathInextsi8_outs__data_anchors_in,
  input  validPathInextsi8_outs_valid__anchors_in,
  input  readyPathInextsi8_outs_ready__anchors_in,
  input [31:0] dataPathInextsi9_outs__data_anchors_in,
  input  validPathInextsi9_outs_valid__anchors_in,
  input  readyPathInextsi9_outs_ready__anchors_in,
  input [31:0] dataPathInbuffer2_outs__data_anchors_in,
  input  validPathInbuffer2_outs_valid__anchors_in,
  input  readyPathInbuffer2_outs_ready__anchors_in,
  input [31:0] dataPathInbuffer3_outs__data_anchors_in,
  input  validPathInbuffer3_outs_valid__anchors_in,
  input  readyPathInbuffer3_outs_ready__anchors_in,
  input [31:0] dataPathInmux1_outs__data_anchors_in,
  input  validPathInmux1_outs_valid__anchors_in,
  input  readyPathInmux1_outs_ready__anchors_in,
  input  validPathInbuffer4_outs_valid__anchors_in,
  input  readyPathInbuffer4_outs_ready__anchors_in,
  input  validPathInbuffer5_outs_valid__anchors_in,
  input  readyPathInbuffer5_outs_ready__anchors_in,
  input  validPathIncontrol_merge0_outs_valid__anchors_in,
  input  readyPathIncontrol_merge0_outs_ready__anchors_in,
  input  dataPathIncontrol_merge0_index__data_anchors_in,
  input  validPathIncontrol_merge0_index_valid__anchors_in,
  input  readyPathIncontrol_merge0_index_ready__anchors_in,
  input  dataPathInfork3_outs_0__data_anchors_in,
  input  validPathInfork3_outs_0_valid__anchors_in,
  input  readyPathInfork3_outs_0_ready__anchors_in,
  input  dataPathInfork3_outs_1__data_anchors_in,
  input  validPathInfork3_outs_1_valid__anchors_in,
  input  readyPathInfork3_outs_1_ready__anchors_in,
  input  validPathInsource0_outs_valid__anchors_in,
  input  readyPathInsource0_outs_ready__anchors_in,
  input [10:0] dataPathInconstant1_outs__data_anchors_in,
  input  validPathInconstant1_outs_valid__anchors_in,
  input  readyPathInconstant1_outs_ready__anchors_in,
  input [11:0] dataPathInextsi10_outs__data_anchors_in,
  input  validPathInextsi10_outs_valid__anchors_in,
  input  readyPathInextsi10_outs_ready__anchors_in,
  input  validPathInsource1_outs_valid__anchors_in,
  input  readyPathInsource1_outs_ready__anchors_in,
  input [10:0] dataPathInconstant4_outs__data_anchors_in,
  input  validPathInconstant4_outs_valid__anchors_in,
  input  readyPathInconstant4_outs_ready__anchors_in,
  input [11:0] dataPathInextsi11_outs__data_anchors_in,
  input  validPathInextsi11_outs_valid__anchors_in,
  input  readyPathInextsi11_outs_ready__anchors_in,
  input  validPathInsource2_outs_valid__anchors_in,
  input  readyPathInsource2_outs_ready__anchors_in,
  input [1:0] dataPathInconstant8_outs__data_anchors_in,
  input  validPathInconstant8_outs_valid__anchors_in,
  input  readyPathInconstant8_outs_ready__anchors_in,
  input [11:0] dataPathInextsi12_outs__data_anchors_in,
  input  validPathInextsi12_outs_valid__anchors_in,
  input  readyPathInextsi12_outs_ready__anchors_in,
  input [31:0] dataPathInmc_load0_addrOut__data_anchors_in,
  input  validPathInmc_load0_addrOut_valid__anchors_in,
  input  readyPathInmc_load0_addrOut_ready__anchors_in,
  input [31:0] dataPathInmc_load0_dataOut__data_anchors_in,
  input  validPathInmc_load0_dataOut_valid__anchors_in,
  input  readyPathInmc_load0_dataOut_ready__anchors_in,
  input [11:0] dataPathInsubi1_result__data_anchors_in,
  input  validPathInsubi1_result_valid__anchors_in,
  input  readyPathInsubi1_result_ready__anchors_in,
  input [31:0] dataPathInextsi13_outs__data_anchors_in,
  input  validPathInextsi13_outs_valid__anchors_in,
  input  readyPathInextsi13_outs_ready__anchors_in,
  input [31:0] dataPathInmc_load1_addrOut__data_anchors_in,
  input  validPathInmc_load1_addrOut_valid__anchors_in,
  input  readyPathInmc_load1_addrOut_ready__anchors_in,
  input [31:0] dataPathInmc_load1_dataOut__data_anchors_in,
  input  validPathInmc_load1_dataOut_valid__anchors_in,
  input  readyPathInmc_load1_dataOut_ready__anchors_in,
  input [31:0] dataPathInmuli0_result__data_anchors_in,
  input  validPathInmuli0_result_valid__anchors_in,
  input  readyPathInmuli0_result_ready__anchors_in,
  input [31:0] dataPathInaddi0_result__data_anchors_in,
  input  validPathInaddi0_result_valid__anchors_in,
  input  readyPathInaddi0_result_ready__anchors_in,
  input [11:0] dataPathInaddi1_result__data_anchors_in,
  input  validPathInaddi1_result_valid__anchors_in,
  input  readyPathInaddi1_result_ready__anchors_in,
  input [11:0] dataPathInfork4_outs_0__data_anchors_in,
  input  validPathInfork4_outs_0_valid__anchors_in,
  input  readyPathInfork4_outs_0_ready__anchors_in,
  input [11:0] dataPathInfork4_outs_1__data_anchors_in,
  input  validPathInfork4_outs_1_valid__anchors_in,
  input  readyPathInfork4_outs_1_ready__anchors_in,
  input [10:0] dataPathIntrunci0_outs__data_anchors_in,
  input  validPathIntrunci0_outs_valid__anchors_in,
  input  readyPathIntrunci0_outs_ready__anchors_in,
  input  dataPathIncmpi1_result__data_anchors_in,
  input  validPathIncmpi1_result_valid__anchors_in,
  input  readyPathIncmpi1_result_ready__anchors_in,
  input  dataPathInfork5_outs_0__data_anchors_in,
  input  validPathInfork5_outs_0_valid__anchors_in,
  input  readyPathInfork5_outs_0_ready__anchors_in,
  input  dataPathInfork5_outs_1__data_anchors_in,
  input  validPathInfork5_outs_1_valid__anchors_in,
  input  readyPathInfork5_outs_1_ready__anchors_in,
  input  dataPathInfork5_outs_2__data_anchors_in,
  input  validPathInfork5_outs_2_valid__anchors_in,
  input  readyPathInfork5_outs_2_ready__anchors_in,
  input [10:0] dataPathIncond_br0_trueOut__data_anchors_in,
  input  validPathIncond_br0_trueOut_valid__anchors_in,
  input  readyPathIncond_br0_trueOut_ready__anchors_in,
  input [10:0] dataPathIncond_br0_falseOut__data_anchors_in,
  input  validPathIncond_br0_falseOut_valid__anchors_in,
  input  readyPathIncond_br0_falseOut_ready__anchors_in,
  input [31:0] dataPathIncond_br2_trueOut__data_anchors_in,
  input  validPathIncond_br2_trueOut_valid__anchors_in,
  input  readyPathIncond_br2_trueOut_ready__anchors_in,
  input [31:0] dataPathIncond_br2_falseOut__data_anchors_in,
  input  validPathIncond_br2_falseOut_valid__anchors_in,
  input  readyPathIncond_br2_falseOut_ready__anchors_in,
  input  validPathIncond_br3_trueOut_valid__anchors_in,
  input  readyPathIncond_br3_trueOut_ready__anchors_in,
  input  validPathIncond_br3_falseOut_valid__anchors_in,
  input  readyPathIncond_br3_falseOut_ready__anchors_in,
  input  validPathInfork6_outs_0_valid__anchors_in,
  input  readyPathInfork6_outs_0_ready__anchors_in,
  input  validPathInfork6_outs_1_valid__anchors_in,
  input  readyPathInfork6_outs_1_ready__anchors_in,
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
  output  validPathOutfork0_outs_0_valid__anchors_out,
  output  readyPathOutfork0_outs_0_ready__anchors_out,
  output  validPathOutfork0_outs_1_valid__anchors_out,
  output  readyPathOutfork0_outs_1_ready__anchors_out,
  output  validPathOutfork0_outs_2_valid__anchors_out,
  output  readyPathOutfork0_outs_2_ready__anchors_out,
  output [31:0] dataPathOutmem_controller0_ldData_0__data_anchors_out,
  output  validPathOutmem_controller0_ldData_0_valid__anchors_out,
  output  readyPathOutmem_controller0_ldData_0_ready__anchors_out,
  output  validPathOutmem_controller0_memEnd_valid__anchors_out,
  output  readyPathOutmem_controller0_memEnd_ready__anchors_out,
  output [31:0] dataPathOutmem_controller1_ldData_0__data_anchors_out,
  output  validPathOutmem_controller1_ldData_0_valid__anchors_out,
  output  readyPathOutmem_controller1_ldData_0_ready__anchors_out,
  output  validPathOutmem_controller1_memEnd_valid__anchors_out,
  output  readyPathOutmem_controller1_memEnd_ready__anchors_out,
  output  dataPathOutconstant0_outs__data_anchors_out,
  output  validPathOutconstant0_outs_valid__anchors_out,
  output  readyPathOutconstant0_outs_ready__anchors_out,
  output  dataPathOutfork1_outs_0__data_anchors_out,
  output  validPathOutfork1_outs_0_valid__anchors_out,
  output  readyPathOutfork1_outs_0_ready__anchors_out,
  output  dataPathOutfork1_outs_1__data_anchors_out,
  output  validPathOutfork1_outs_1_valid__anchors_out,
  output  readyPathOutfork1_outs_1_ready__anchors_out,
  output [10:0] dataPathOutextsi5_outs__data_anchors_out,
  output  validPathOutextsi5_outs_valid__anchors_out,
  output  readyPathOutextsi5_outs_ready__anchors_out,
  output [31:0] dataPathOutextsi6_outs__data_anchors_out,
  output  validPathOutextsi6_outs_valid__anchors_out,
  output  readyPathOutextsi6_outs_ready__anchors_out,
  output [10:0] dataPathOutbuffer0_outs__data_anchors_out,
  output  validPathOutbuffer0_outs_valid__anchors_out,
  output  readyPathOutbuffer0_outs_ready__anchors_out,
  output [10:0] dataPathOutbuffer1_outs__data_anchors_out,
  output  validPathOutbuffer1_outs_valid__anchors_out,
  output  readyPathOutbuffer1_outs_ready__anchors_out,
  output [10:0] dataPathOutmux2_outs__data_anchors_out,
  output  validPathOutmux2_outs_valid__anchors_out,
  output  readyPathOutmux2_outs_ready__anchors_out,
  output [10:0] dataPathOutfork2_outs_0__data_anchors_out,
  output  validPathOutfork2_outs_0_valid__anchors_out,
  output  readyPathOutfork2_outs_0_ready__anchors_out,
  output [10:0] dataPathOutfork2_outs_1__data_anchors_out,
  output  validPathOutfork2_outs_1_valid__anchors_out,
  output  readyPathOutfork2_outs_1_ready__anchors_out,
  output [10:0] dataPathOutfork2_outs_2__data_anchors_out,
  output  validPathOutfork2_outs_2_valid__anchors_out,
  output  readyPathOutfork2_outs_2_ready__anchors_out,
  output [11:0] dataPathOutextsi7_outs__data_anchors_out,
  output  validPathOutextsi7_outs_valid__anchors_out,
  output  readyPathOutextsi7_outs_ready__anchors_out,
  output [11:0] dataPathOutextsi8_outs__data_anchors_out,
  output  validPathOutextsi8_outs_valid__anchors_out,
  output  readyPathOutextsi8_outs_ready__anchors_out,
  output [31:0] dataPathOutextsi9_outs__data_anchors_out,
  output  validPathOutextsi9_outs_valid__anchors_out,
  output  readyPathOutextsi9_outs_ready__anchors_out,
  output [31:0] dataPathOutbuffer2_outs__data_anchors_out,
  output  validPathOutbuffer2_outs_valid__anchors_out,
  output  readyPathOutbuffer2_outs_ready__anchors_out,
  output [31:0] dataPathOutbuffer3_outs__data_anchors_out,
  output  validPathOutbuffer3_outs_valid__anchors_out,
  output  readyPathOutbuffer3_outs_ready__anchors_out,
  output [31:0] dataPathOutmux1_outs__data_anchors_out,
  output  validPathOutmux1_outs_valid__anchors_out,
  output  readyPathOutmux1_outs_ready__anchors_out,
  output  validPathOutbuffer4_outs_valid__anchors_out,
  output  readyPathOutbuffer4_outs_ready__anchors_out,
  output  validPathOutbuffer5_outs_valid__anchors_out,
  output  readyPathOutbuffer5_outs_ready__anchors_out,
  output  validPathOutcontrol_merge0_outs_valid__anchors_out,
  output  readyPathOutcontrol_merge0_outs_ready__anchors_out,
  output  dataPathOutcontrol_merge0_index__data_anchors_out,
  output  validPathOutcontrol_merge0_index_valid__anchors_out,
  output  readyPathOutcontrol_merge0_index_ready__anchors_out,
  output  dataPathOutfork3_outs_0__data_anchors_out,
  output  validPathOutfork3_outs_0_valid__anchors_out,
  output  readyPathOutfork3_outs_0_ready__anchors_out,
  output  dataPathOutfork3_outs_1__data_anchors_out,
  output  validPathOutfork3_outs_1_valid__anchors_out,
  output  readyPathOutfork3_outs_1_ready__anchors_out,
  output  validPathOutsource0_outs_valid__anchors_out,
  output  readyPathOutsource0_outs_ready__anchors_out,
  output [10:0] dataPathOutconstant1_outs__data_anchors_out,
  output  validPathOutconstant1_outs_valid__anchors_out,
  output  readyPathOutconstant1_outs_ready__anchors_out,
  output [11:0] dataPathOutextsi10_outs__data_anchors_out,
  output  validPathOutextsi10_outs_valid__anchors_out,
  output  readyPathOutextsi10_outs_ready__anchors_out,
  output  validPathOutsource1_outs_valid__anchors_out,
  output  readyPathOutsource1_outs_ready__anchors_out,
  output [10:0] dataPathOutconstant4_outs__data_anchors_out,
  output  validPathOutconstant4_outs_valid__anchors_out,
  output  readyPathOutconstant4_outs_ready__anchors_out,
  output [11:0] dataPathOutextsi11_outs__data_anchors_out,
  output  validPathOutextsi11_outs_valid__anchors_out,
  output  readyPathOutextsi11_outs_ready__anchors_out,
  output  validPathOutsource2_outs_valid__anchors_out,
  output  readyPathOutsource2_outs_ready__anchors_out,
  output [1:0] dataPathOutconstant8_outs__data_anchors_out,
  output  validPathOutconstant8_outs_valid__anchors_out,
  output  readyPathOutconstant8_outs_ready__anchors_out,
  output [11:0] dataPathOutextsi12_outs__data_anchors_out,
  output  validPathOutextsi12_outs_valid__anchors_out,
  output  readyPathOutextsi12_outs_ready__anchors_out,
  output [31:0] dataPathOutmc_load0_addrOut__data_anchors_out,
  output  validPathOutmc_load0_addrOut_valid__anchors_out,
  output  readyPathOutmc_load0_addrOut_ready__anchors_out,
  output [31:0] dataPathOutmc_load0_dataOut__data_anchors_out,
  output  validPathOutmc_load0_dataOut_valid__anchors_out,
  output  readyPathOutmc_load0_dataOut_ready__anchors_out,
  output [11:0] dataPathOutsubi1_result__data_anchors_out,
  output  validPathOutsubi1_result_valid__anchors_out,
  output  readyPathOutsubi1_result_ready__anchors_out,
  output [31:0] dataPathOutextsi13_outs__data_anchors_out,
  output  validPathOutextsi13_outs_valid__anchors_out,
  output  readyPathOutextsi13_outs_ready__anchors_out,
  output [31:0] dataPathOutmc_load1_addrOut__data_anchors_out,
  output  validPathOutmc_load1_addrOut_valid__anchors_out,
  output  readyPathOutmc_load1_addrOut_ready__anchors_out,
  output [31:0] dataPathOutmc_load1_dataOut__data_anchors_out,
  output  validPathOutmc_load1_dataOut_valid__anchors_out,
  output  readyPathOutmc_load1_dataOut_ready__anchors_out,
  output [31:0] dataPathOutmuli0_result__data_anchors_out,
  output  validPathOutmuli0_result_valid__anchors_out,
  output  readyPathOutmuli0_result_ready__anchors_out,
  output [31:0] dataPathOutaddi0_result__data_anchors_out,
  output  validPathOutaddi0_result_valid__anchors_out,
  output  readyPathOutaddi0_result_ready__anchors_out,
  output [11:0] dataPathOutaddi1_result__data_anchors_out,
  output  validPathOutaddi1_result_valid__anchors_out,
  output  readyPathOutaddi1_result_ready__anchors_out,
  output [11:0] dataPathOutfork4_outs_0__data_anchors_out,
  output  validPathOutfork4_outs_0_valid__anchors_out,
  output  readyPathOutfork4_outs_0_ready__anchors_out,
  output [11:0] dataPathOutfork4_outs_1__data_anchors_out,
  output  validPathOutfork4_outs_1_valid__anchors_out,
  output  readyPathOutfork4_outs_1_ready__anchors_out,
  output [10:0] dataPathOuttrunci0_outs__data_anchors_out,
  output  validPathOuttrunci0_outs_valid__anchors_out,
  output  readyPathOuttrunci0_outs_ready__anchors_out,
  output  dataPathOutcmpi1_result__data_anchors_out,
  output  validPathOutcmpi1_result_valid__anchors_out,
  output  readyPathOutcmpi1_result_ready__anchors_out,
  output  dataPathOutfork5_outs_0__data_anchors_out,
  output  validPathOutfork5_outs_0_valid__anchors_out,
  output  readyPathOutfork5_outs_0_ready__anchors_out,
  output  dataPathOutfork5_outs_1__data_anchors_out,
  output  validPathOutfork5_outs_1_valid__anchors_out,
  output  readyPathOutfork5_outs_1_ready__anchors_out,
  output  dataPathOutfork5_outs_2__data_anchors_out,
  output  validPathOutfork5_outs_2_valid__anchors_out,
  output  readyPathOutfork5_outs_2_ready__anchors_out,
  output [10:0] dataPathOutcond_br0_trueOut__data_anchors_out,
  output  validPathOutcond_br0_trueOut_valid__anchors_out,
  output  readyPathOutcond_br0_trueOut_ready__anchors_out,
  output [10:0] dataPathOutcond_br0_falseOut__data_anchors_out,
  output  validPathOutcond_br0_falseOut_valid__anchors_out,
  output  readyPathOutcond_br0_falseOut_ready__anchors_out,
  output [31:0] dataPathOutcond_br2_trueOut__data_anchors_out,
  output  validPathOutcond_br2_trueOut_valid__anchors_out,
  output  readyPathOutcond_br2_trueOut_ready__anchors_out,
  output [31:0] dataPathOutcond_br2_falseOut__data_anchors_out,
  output  validPathOutcond_br2_falseOut_valid__anchors_out,
  output  readyPathOutcond_br2_falseOut_ready__anchors_out,
  output  validPathOutcond_br3_trueOut_valid__anchors_out,
  output  readyPathOutcond_br3_trueOut_ready__anchors_out,
  output  validPathOutcond_br3_falseOut_valid__anchors_out,
  output  readyPathOutcond_br3_falseOut_ready__anchors_out,
  output  validPathOutfork6_outs_0_valid__anchors_out,
  output  readyPathOutfork6_outs_0_ready__anchors_out,
  output  validPathOutfork6_outs_1_valid__anchors_out,
  output  readyPathOutfork6_outs_1_ready__anchors_out
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
  assign out0 = dataPathOutcond_br2_falseOut__data_anchors_out;
  assign out0_valid = validPathOutcond_br2_falseOut_valid__anchors_out;
  assign cond_br2_falseOut_ready = out0_ready;
  assign di_end_valid = validPathOutmem_controller1_memEnd_valid__anchors_out;
  assign mem_controller1_memEnd_ready = di_end_ready;
  assign idx_end_valid = validPathOutmem_controller0_memEnd_valid__anchors_out;
  assign mem_controller0_memEnd_ready = idx_end_ready;
  assign end_valid = validPathOutfork0_outs_1_valid__anchors_out;
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
.outs_ready ({readyPathInfork0_outs_2_ready__anchors_in, readyPathInfork0_outs_1_ready__anchors_in, readyPathInfork0_outs_0_ready__anchors_in}),
.outs_valid ({validPathOutfork0_outs_2_valid__anchors_out, validPathOutfork0_outs_1_valid__anchors_out, validPathOutfork0_outs_0_valid__anchors_out}),
.rst (rst)
);

mem_controller_storeless #(.NUM_LOADS(1), .DATA_TYPE(32), .ADDR_TYPE(32)) mem_controller0(
.clk (clk),
.ctrlEnd_ready (readyPathOutfork6_outs_0_ready__anchors_out),
.ctrlEnd_valid (validPathInfork6_outs_0_valid__anchors_in),
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
.ctrlEnd_ready (readyPathOutfork6_outs_1_ready__anchors_out),
.ctrlEnd_valid (validPathInfork6_outs_1_valid__anchors_in),
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
.ctrl_ready (readyPathOutfork0_outs_0_ready__anchors_out),
.ctrl_valid (validPathInfork0_outs_0_valid__anchors_in),
.outs (dataPathOutconstant0_outs__data_anchors_out),
.outs_ready (readyPathInconstant0_outs_ready__anchors_in),
.outs_valid (validPathOutconstant0_outs_valid__anchors_out),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(1)) fork1(
.clk (clk),
.ins (dataPathInconstant0_outs__data_anchors_in),
.ins_ready (readyPathOutconstant0_outs_ready__anchors_out),
.ins_valid (validPathInconstant0_outs_valid__anchors_in),
.outs ({dataPathOutfork1_outs_1__data_anchors_out, dataPathOutfork1_outs_0__data_anchors_out}),
.outs_ready ({readyPathInfork1_outs_1_ready__anchors_in, readyPathInfork1_outs_0_ready__anchors_in}),
.outs_valid ({validPathOutfork1_outs_1_valid__anchors_out, validPathOutfork1_outs_0_valid__anchors_out}),
.rst (rst)
);

extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(11)) extsi5(
.clk (clk),
.ins (dataPathInfork1_outs_0__data_anchors_in),
.ins_ready (readyPathOutfork1_outs_0_ready__anchors_out),
.ins_valid (validPathInfork1_outs_0_valid__anchors_in),
.outs (dataPathOutextsi5_outs__data_anchors_out),
.outs_ready (readyPathInextsi5_outs_ready__anchors_in),
.outs_valid (validPathOutextsi5_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(1), .OUTPUT_TYPE(32)) extsi6(
.clk (clk),
.ins (dataPathInfork1_outs_1__data_anchors_in),
.ins_ready (readyPathOutfork1_outs_1_ready__anchors_out),
.ins_valid (validPathInfork1_outs_1_valid__anchors_in),
.outs (dataPathOutextsi6_outs__data_anchors_out),
.outs_ready (readyPathInextsi6_outs_ready__anchors_in),
.outs_valid (validPathOutextsi6_outs_valid__anchors_out),
.rst (rst)
);

oehb #(.DATA_TYPE(11)) buffer0(
.clk (clk),
.ins (dataPathIncond_br0_trueOut__data_anchors_in),
.ins_ready (readyPathOutcond_br0_trueOut_ready__anchors_out),
.ins_valid (validPathIncond_br0_trueOut_valid__anchors_in),
.outs (dataPathOutbuffer0_outs__data_anchors_out),
.outs_ready (readyPathInbuffer0_outs_ready__anchors_in),
.outs_valid (validPathOutbuffer0_outs_valid__anchors_out),
.rst (rst)
);

tehb #(.DATA_TYPE(11)) buffer1(
.clk (clk),
.ins (dataPathInbuffer0_outs__data_anchors_in),
.ins_ready (readyPathOutbuffer0_outs_ready__anchors_out),
.ins_valid (validPathInbuffer0_outs_valid__anchors_in),
.outs (dataPathOutbuffer1_outs__data_anchors_out),
.outs_ready (readyPathInbuffer1_outs_ready__anchors_in),
.outs_valid (validPathOutbuffer1_outs_valid__anchors_out),
.rst (rst)
);

mux #(.SIZE(2), .DATA_TYPE(11), .SELECT_TYPE(1)) mux2(
.clk (clk),
.index (dataPathInfork3_outs_0__data_anchors_in),
.index_ready (readyPathOutfork3_outs_0_ready__anchors_out),
.index_valid (validPathInfork3_outs_0_valid__anchors_in),
.ins ({dataPathInbuffer1_outs__data_anchors_in, dataPathInextsi5_outs__data_anchors_in}),
.ins_ready ({readyPathOutbuffer1_outs_ready__anchors_out, readyPathOutextsi5_outs_ready__anchors_out}),
.ins_valid ({validPathInbuffer1_outs_valid__anchors_in, validPathInextsi5_outs_valid__anchors_in}),
.outs (dataPathOutmux2_outs__data_anchors_out),
.outs_ready (readyPathInmux2_outs_ready__anchors_in),
.outs_valid (validPathOutmux2_outs_valid__anchors_out),
.rst (rst)
);

fork_type #(.SIZE(3), .DATA_TYPE(11)) fork2(
.clk (clk),
.ins (dataPathInmux2_outs__data_anchors_in),
.ins_ready (readyPathOutmux2_outs_ready__anchors_out),
.ins_valid (validPathInmux2_outs_valid__anchors_in),
.outs ({dataPathOutfork2_outs_2__data_anchors_out, dataPathOutfork2_outs_1__data_anchors_out, dataPathOutfork2_outs_0__data_anchors_out}),
.outs_ready ({readyPathInfork2_outs_2_ready__anchors_in, readyPathInfork2_outs_1_ready__anchors_in, readyPathInfork2_outs_0_ready__anchors_in}),
.outs_valid ({validPathOutfork2_outs_2_valid__anchors_out, validPathOutfork2_outs_1_valid__anchors_out, validPathOutfork2_outs_0_valid__anchors_out}),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi7(
.clk (clk),
.ins (dataPathInfork2_outs_0__data_anchors_in),
.ins_ready (readyPathOutfork2_outs_0_ready__anchors_out),
.ins_valid (validPathInfork2_outs_0_valid__anchors_in),
.outs (dataPathOutextsi7_outs__data_anchors_out),
.outs_ready (readyPathInextsi7_outs_ready__anchors_in),
.outs_valid (validPathOutextsi7_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi8(
.clk (clk),
.ins (dataPathInfork2_outs_1__data_anchors_in),
.ins_ready (readyPathOutfork2_outs_1_ready__anchors_out),
.ins_valid (validPathInfork2_outs_1_valid__anchors_in),
.outs (dataPathOutextsi8_outs__data_anchors_out),
.outs_ready (readyPathInextsi8_outs_ready__anchors_in),
.outs_valid (validPathOutextsi8_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(32)) extsi9(
.clk (clk),
.ins (dataPathInfork2_outs_2__data_anchors_in),
.ins_ready (readyPathOutfork2_outs_2_ready__anchors_out),
.ins_valid (validPathInfork2_outs_2_valid__anchors_in),
.outs (dataPathOutextsi9_outs__data_anchors_out),
.outs_ready (readyPathInextsi9_outs_ready__anchors_in),
.outs_valid (validPathOutextsi9_outs_valid__anchors_out),
.rst (rst)
);

oehb #(.DATA_TYPE(32)) buffer2(
.clk (clk),
.ins (dataPathIncond_br2_trueOut__data_anchors_in),
.ins_ready (readyPathOutcond_br2_trueOut_ready__anchors_out),
.ins_valid (validPathIncond_br2_trueOut_valid__anchors_in),
.outs (dataPathOutbuffer2_outs__data_anchors_out),
.outs_ready (readyPathInbuffer2_outs_ready__anchors_in),
.outs_valid (validPathOutbuffer2_outs_valid__anchors_out),
.rst (rst)
);

tehb #(.DATA_TYPE(32)) buffer3(
.clk (clk),
.ins (dataPathInbuffer2_outs__data_anchors_in),
.ins_ready (readyPathOutbuffer2_outs_ready__anchors_out),
.ins_valid (validPathInbuffer2_outs_valid__anchors_in),
.outs (dataPathOutbuffer3_outs__data_anchors_out),
.outs_ready (readyPathInbuffer3_outs_ready__anchors_in),
.outs_valid (validPathOutbuffer3_outs_valid__anchors_out),
.rst (rst)
);

mux #(.SIZE(2), .DATA_TYPE(32), .SELECT_TYPE(1)) mux1(
.clk (clk),
.index (dataPathInfork3_outs_1__data_anchors_in),
.index_ready (readyPathOutfork3_outs_1_ready__anchors_out),
.index_valid (validPathInfork3_outs_1_valid__anchors_in),
.ins ({dataPathInbuffer3_outs__data_anchors_in, dataPathInextsi6_outs__data_anchors_in}),
.ins_ready ({readyPathOutbuffer3_outs_ready__anchors_out, readyPathOutextsi6_outs_ready__anchors_out}),
.ins_valid ({validPathInbuffer3_outs_valid__anchors_in, validPathInextsi6_outs_valid__anchors_in}),
.outs (dataPathOutmux1_outs__data_anchors_out),
.outs_ready (readyPathInmux1_outs_ready__anchors_in),
.outs_valid (validPathOutmux1_outs_valid__anchors_out),
.rst (rst)
);

oehb_dataless buffer4(
.clk (clk),
.ins_ready (readyPathOutcond_br3_trueOut_ready__anchors_out),
.ins_valid (validPathIncond_br3_trueOut_valid__anchors_in),
.outs_ready (readyPathInbuffer4_outs_ready__anchors_in),
.outs_valid (validPathOutbuffer4_outs_valid__anchors_out),
.rst (rst)
);

tehb_dataless buffer5(
.clk (clk),
.ins_ready (readyPathOutbuffer4_outs_ready__anchors_out),
.ins_valid (validPathInbuffer4_outs_valid__anchors_in),
.outs_ready (readyPathInbuffer5_outs_ready__anchors_in),
.outs_valid (validPathOutbuffer5_outs_valid__anchors_out),
.rst (rst)
);

control_merge_dataless #(.SIZE(2), .INDEX_TYPE(1)) control_merge0(
.clk (clk),
.index (control_merge0_index),
.index_ready (readyPathIncontrol_merge0_index_ready__anchors_in),
.index_valid (control_merge0_index_valid),
.ins_ready ({readyPathOutbuffer5_outs_ready__anchors_out, readyPathOutfork0_outs_2_ready__anchors_out}),
.ins_valid ({validPathInbuffer5_outs_valid__anchors_in, validPathInfork0_outs_2_valid__anchors_in}),
.outs_ready (readyPathIncontrol_merge0_outs_ready__anchors_in),
.outs_valid (validPathOutcontrol_merge0_outs_valid__anchors_out),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(1)) fork3(
.clk (clk),
.ins (dataPathIncontrol_merge0_index__data_anchors_in),
.ins_ready (readyPathOutcontrol_merge0_index_ready__anchors_out),
.ins_valid (validPathIncontrol_merge0_index_valid__anchors_in),
.outs ({dataPathOutfork3_outs_1__data_anchors_out, dataPathOutfork3_outs_0__data_anchors_out}),
.outs_ready ({readyPathInfork3_outs_1_ready__anchors_in, readyPathInfork3_outs_0_ready__anchors_in}),
.outs_valid ({validPathOutfork3_outs_1_valid__anchors_out, validPathOutfork3_outs_0_valid__anchors_out}),
.rst (rst)
);

source source0(
.clk (clk),
.outs_ready (readyPathInsource0_outs_ready__anchors_in),
.outs_valid (validPathOutsource0_outs_valid__anchors_out),
.rst (rst)
);

handshake_constant_1 #(.DATA_WIDTH(11)) constant1(
.clk (clk),
.ctrl_ready (readyPathOutsource0_outs_ready__anchors_out),
.ctrl_valid (validPathInsource0_outs_valid__anchors_in),
.outs (dataPathOutconstant1_outs__data_anchors_out),
.outs_ready (readyPathInconstant1_outs_ready__anchors_in),
.outs_valid (validPathOutconstant1_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi10(
.clk (clk),
.ins (dataPathInconstant1_outs__data_anchors_in),
.ins_ready (readyPathOutconstant1_outs_ready__anchors_out),
.ins_valid (validPathInconstant1_outs_valid__anchors_in),
.outs (dataPathOutextsi10_outs__data_anchors_out),
.outs_ready (readyPathInextsi10_outs_ready__anchors_in),
.outs_valid (validPathOutextsi10_outs_valid__anchors_out),
.rst (rst)
);

source source1(
.clk (clk),
.outs_ready (readyPathInsource1_outs_ready__anchors_in),
.outs_valid (validPathOutsource1_outs_valid__anchors_out),
.rst (rst)
);

handshake_constant_2 #(.DATA_WIDTH(11)) constant4(
.clk (clk),
.ctrl_ready (readyPathOutsource1_outs_ready__anchors_out),
.ctrl_valid (validPathInsource1_outs_valid__anchors_in),
.outs (dataPathOutconstant4_outs__data_anchors_out),
.outs_ready (readyPathInconstant4_outs_ready__anchors_in),
.outs_valid (validPathOutconstant4_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(11), .OUTPUT_TYPE(12)) extsi11(
.clk (clk),
.ins (dataPathInconstant4_outs__data_anchors_in),
.ins_ready (readyPathOutconstant4_outs_ready__anchors_out),
.ins_valid (validPathInconstant4_outs_valid__anchors_in),
.outs (dataPathOutextsi11_outs__data_anchors_out),
.outs_ready (readyPathInextsi11_outs_ready__anchors_in),
.outs_valid (validPathOutextsi11_outs_valid__anchors_out),
.rst (rst)
);

source source2(
.clk (clk),
.outs_ready (readyPathInsource2_outs_ready__anchors_in),
.outs_valid (validPathOutsource2_outs_valid__anchors_out),
.rst (rst)
);

handshake_constant_3 #(.DATA_WIDTH(2)) constant8(
.clk (clk),
.ctrl_ready (readyPathOutsource2_outs_ready__anchors_out),
.ctrl_valid (validPathInsource2_outs_valid__anchors_in),
.outs (dataPathOutconstant8_outs__data_anchors_out),
.outs_ready (readyPathInconstant8_outs_ready__anchors_in),
.outs_valid (validPathOutconstant8_outs_valid__anchors_out),
.rst (rst)
);

extsi #(.INPUT_TYPE(2), .OUTPUT_TYPE(12)) extsi12(
.clk (clk),
.ins (dataPathInconstant8_outs__data_anchors_in),
.ins_ready (readyPathOutconstant8_outs_ready__anchors_out),
.ins_valid (validPathInconstant8_outs_valid__anchors_in),
.outs (dataPathOutextsi12_outs__data_anchors_out),
.outs_ready (readyPathInextsi12_outs_ready__anchors_in),
.outs_valid (validPathOutextsi12_outs_valid__anchors_out),
.rst (rst)
);

mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load0(
.addrIn (dataPathInextsi9_outs__data_anchors_in),
.addrIn_ready (readyPathOutextsi9_outs_ready__anchors_out),
.addrIn_valid (validPathInextsi9_outs_valid__anchors_in),
.addrOut (mc_load0_addrOut),
.addrOut_ready (mc_load0_addrOut_ready),
.addrOut_valid (mc_load0_addrOut_valid),
.clk (clk),
.dataFromMem (dataPathInmem_controller0_ldData_0__data_anchors_in),
.dataFromMem_ready (readyPathOutmem_controller0_ldData_0_ready__anchors_out),
.dataFromMem_valid (validPathInmem_controller0_ldData_0_valid__anchors_in),
.dataOut (mc_load0_dataOut),
.dataOut_ready (mc_load0_dataOut_ready),
.dataOut_valid (mc_load0_dataOut_valid),
.rst (rst)
);

subi #(.DATA_TYPE(12)) subi1(
.clk (clk),
.lhs (dataPathInextsi10_outs__data_anchors_in),
.lhs_ready (readyPathOutextsi10_outs_ready__anchors_out),
.lhs_valid (validPathInextsi10_outs_valid__anchors_in),
.result (dataPathOutsubi1_result__data_anchors_out),
.result_ready (readyPathInsubi1_result_ready__anchors_in),
.result_valid (validPathOutsubi1_result_valid__anchors_out),
.rhs (dataPathInextsi8_outs__data_anchors_in),
.rhs_ready (readyPathOutextsi8_outs_ready__anchors_out),
.rhs_valid (validPathInextsi8_outs_valid__anchors_in),
.rst (rst)
);

extsi #(.INPUT_TYPE(12), .OUTPUT_TYPE(32)) extsi13(
.clk (clk),
.ins (dataPathInsubi1_result__data_anchors_in),
.ins_ready (readyPathOutsubi1_result_ready__anchors_out),
.ins_valid (validPathInsubi1_result_valid__anchors_in),
.outs (dataPathOutextsi13_outs__data_anchors_out),
.outs_ready (readyPathInextsi13_outs_ready__anchors_in),
.outs_valid (validPathOutextsi13_outs_valid__anchors_out),
.rst (rst)
);

mc_load #(.DATA_TYPE(32), .ADDR_TYPE(32)) mc_load1(
.addrIn (dataPathInextsi13_outs__data_anchors_in),
.addrIn_ready (readyPathOutextsi13_outs_ready__anchors_out),
.addrIn_valid (validPathInextsi13_outs_valid__anchors_in),
.addrOut (mc_load1_addrOut),
.addrOut_ready (mc_load1_addrOut_ready),
.addrOut_valid (mc_load1_addrOut_valid),
.clk (clk),
.dataFromMem (dataPathInmem_controller1_ldData_0__data_anchors_in),
.dataFromMem_ready (readyPathOutmem_controller1_ldData_0_ready__anchors_out),
.dataFromMem_valid (validPathInmem_controller1_ldData_0_valid__anchors_in),
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
.result (dataPathOutmuli0_result__data_anchors_out),
.result_ready (readyPathInmuli0_result_ready__anchors_in),
.result_valid (validPathOutmuli0_result_valid__anchors_out),
.rhs (mc_load1_dataOut),
.rhs_ready (mc_load1_dataOut_ready),
.rhs_valid (mc_load1_dataOut_valid),
.rst (rst)
);

addi #(.DATA_TYPE(32)) addi0(
.clk (clk),
.lhs (dataPathInmux1_outs__data_anchors_in),
.lhs_ready (readyPathOutmux1_outs_ready__anchors_out),
.lhs_valid (validPathInmux1_outs_valid__anchors_in),
.result (dataPathOutaddi0_result__data_anchors_out),
.result_ready (readyPathInaddi0_result_ready__anchors_in),
.result_valid (validPathOutaddi0_result_valid__anchors_out),
.rhs (dataPathInmuli0_result__data_anchors_in),
.rhs_ready (readyPathOutmuli0_result_ready__anchors_out),
.rhs_valid (validPathInmuli0_result_valid__anchors_in),
.rst (rst)
);

addi #(.DATA_TYPE(12)) addi1(
.clk (clk),
.lhs (dataPathInextsi7_outs__data_anchors_in),
.lhs_ready (readyPathOutextsi7_outs_ready__anchors_out),
.lhs_valid (validPathInextsi7_outs_valid__anchors_in),
.result (dataPathOutaddi1_result__data_anchors_out),
.result_ready (readyPathInaddi1_result_ready__anchors_in),
.result_valid (validPathOutaddi1_result_valid__anchors_out),
.rhs (dataPathInextsi12_outs__data_anchors_in),
.rhs_ready (readyPathOutextsi12_outs_ready__anchors_out),
.rhs_valid (validPathInextsi12_outs_valid__anchors_in),
.rst (rst)
);

fork_type #(.SIZE(2), .DATA_TYPE(12)) fork4(
.clk (clk),
.ins (dataPathInaddi1_result__data_anchors_in),
.ins_ready (readyPathOutaddi1_result_ready__anchors_out),
.ins_valid (validPathInaddi1_result_valid__anchors_in),
.outs ({dataPathOutfork4_outs_1__data_anchors_out, dataPathOutfork4_outs_0__data_anchors_out}),
.outs_ready ({readyPathInfork4_outs_1_ready__anchors_in, readyPathInfork4_outs_0_ready__anchors_in}),
.outs_valid ({validPathOutfork4_outs_1_valid__anchors_out, validPathOutfork4_outs_0_valid__anchors_out}),
.rst (rst)
);

trunci #(.INPUT_TYPE(12), .OUTPUT_TYPE(11)) trunci0(
.clk (clk),
.ins (dataPathInfork4_outs_0__data_anchors_in),
.ins_ready (readyPathOutfork4_outs_0_ready__anchors_out),
.ins_valid (validPathInfork4_outs_0_valid__anchors_in),
.outs (dataPathOuttrunci0_outs__data_anchors_out),
.outs_ready (readyPathIntrunci0_outs_ready__anchors_in),
.outs_valid (validPathOuttrunci0_outs_valid__anchors_out),
.rst (rst)
);

handshake_cmpi_0 #(.DATA_TYPE(12)) cmpi1(
.clk (clk),
.lhs (dataPathInfork4_outs_1__data_anchors_in),
.lhs_ready (readyPathOutfork4_outs_1_ready__anchors_out),
.lhs_valid (validPathInfork4_outs_1_valid__anchors_in),
.result (dataPathOutcmpi1_result__data_anchors_out),
.result_ready (readyPathIncmpi1_result_ready__anchors_in),
.result_valid (validPathOutcmpi1_result_valid__anchors_out),
.rhs (dataPathInextsi11_outs__data_anchors_in),
.rhs_ready (readyPathOutextsi11_outs_ready__anchors_out),
.rhs_valid (validPathInextsi11_outs_valid__anchors_in),
.rst (rst)
);

fork_type #(.SIZE(3), .DATA_TYPE(1)) fork5(
.clk (clk),
.ins (dataPathIncmpi1_result__data_anchors_in),
.ins_ready (readyPathOutcmpi1_result_ready__anchors_out),
.ins_valid (validPathIncmpi1_result_valid__anchors_in),
.outs ({dataPathOutfork5_outs_2__data_anchors_out, dataPathOutfork5_outs_1__data_anchors_out, dataPathOutfork5_outs_0__data_anchors_out}),
.outs_ready ({readyPathInfork5_outs_2_ready__anchors_in, readyPathInfork5_outs_1_ready__anchors_in, readyPathInfork5_outs_0_ready__anchors_in}),
.outs_valid ({validPathOutfork5_outs_2_valid__anchors_out, validPathOutfork5_outs_1_valid__anchors_out, validPathOutfork5_outs_0_valid__anchors_out}),
.rst (rst)
);

cond_br #(.DATA_TYPE(11)) cond_br0(
.clk (clk),
.condition (dataPathInfork5_outs_0__data_anchors_in),
.condition_ready (readyPathOutfork5_outs_0_ready__anchors_out),
.condition_valid (validPathInfork5_outs_0_valid__anchors_in),
.data (dataPathIntrunci0_outs__data_anchors_in),
.data_ready (readyPathOuttrunci0_outs_ready__anchors_out),
.data_valid (validPathIntrunci0_outs_valid__anchors_in),
.falseOut (dataPathOutcond_br0_falseOut__data_anchors_out),
.falseOut_ready (readyPathIncond_br0_falseOut_ready__anchors_in),
.falseOut_valid (validPathOutcond_br0_falseOut_valid__anchors_out),
.rst (rst),
.trueOut (dataPathOutcond_br0_trueOut__data_anchors_out),
.trueOut_ready (readyPathIncond_br0_trueOut_ready__anchors_in),
.trueOut_valid (validPathOutcond_br0_trueOut_valid__anchors_out)
);

sink #(.DATA_TYPE(11)) sink0(
.clk (clk),
.ins (dataPathIncond_br0_falseOut__data_anchors_in),
.ins_ready (readyPathOutcond_br0_falseOut_ready__anchors_out),
.ins_valid (validPathIncond_br0_falseOut_valid__anchors_in),
.rst (rst)
);

cond_br #(.DATA_TYPE(32)) cond_br2(
.clk (clk),
.condition (dataPathInfork5_outs_1__data_anchors_in),
.condition_ready (readyPathOutfork5_outs_1_ready__anchors_out),
.condition_valid (validPathInfork5_outs_1_valid__anchors_in),
.data (dataPathInaddi0_result__data_anchors_in),
.data_ready (readyPathOutaddi0_result_ready__anchors_out),
.data_valid (validPathInaddi0_result_valid__anchors_in),
.falseOut (dataPathOutcond_br2_falseOut__data_anchors_out),
.falseOut_ready (readyPathIncond_br2_falseOut_ready__anchors_in),
.falseOut_valid (validPathOutcond_br2_falseOut_valid__anchors_out),
.rst (rst),
.trueOut (dataPathOutcond_br2_trueOut__data_anchors_out),
.trueOut_ready (readyPathIncond_br2_trueOut_ready__anchors_in),
.trueOut_valid (validPathOutcond_br2_trueOut_valid__anchors_out)
);

cond_br_dataless cond_br3(
.clk (clk),
.condition (dataPathInfork5_outs_2__data_anchors_in),
.condition_ready (readyPathOutfork5_outs_2_ready__anchors_out),
.condition_valid (validPathInfork5_outs_2_valid__anchors_in),
.data_ready (readyPathOutcontrol_merge0_outs_ready__anchors_out),
.data_valid (validPathIncontrol_merge0_outs_valid__anchors_in),
.falseOut_ready (readyPathIncond_br3_falseOut_ready__anchors_in),
.falseOut_valid (validPathOutcond_br3_falseOut_valid__anchors_out),
.rst (rst),
.trueOut_ready (readyPathIncond_br3_trueOut_ready__anchors_in),
.trueOut_valid (validPathOutcond_br3_trueOut_valid__anchors_out)
);

fork_dataless #(.SIZE(2)) fork6(
.clk (clk),
.ins_ready (readyPathOutcond_br3_falseOut_ready__anchors_out),
.ins_valid (validPathIncond_br3_falseOut_valid__anchors_in),
.outs_ready ({readyPathInfork6_outs_1_ready__anchors_in, readyPathInfork6_outs_0_ready__anchors_in}),
.outs_valid ({validPathOutfork6_outs_1_valid__anchors_out, validPathOutfork6_outs_0_valid__anchors_out}),
.rst (rst)
);

endmodule
