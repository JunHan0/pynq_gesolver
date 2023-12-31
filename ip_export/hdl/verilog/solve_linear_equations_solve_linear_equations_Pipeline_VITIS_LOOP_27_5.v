// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module solve_linear_equations_solve_linear_equations_Pipeline_VITIS_LOOP_27_5 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        sext_ln27,
        B_local_load_2,
        add_ln28,
        A_local_address0,
        A_local_ce0,
        A_local_q0,
        select_ln27,
        X_local_address0,
        X_local_ce0,
        X_local_q0,
        sub5618_i_out,
        sub5618_i_out_ap_vld,
        grp_fu_339_p_din0,
        grp_fu_339_p_din1,
        grp_fu_339_p_opcode,
        grp_fu_339_p_dout0,
        grp_fu_339_p_ce,
        grp_fu_1156_p_din0,
        grp_fu_1156_p_din1,
        grp_fu_1156_p_dout0,
        grp_fu_1156_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 5'd1;
parameter    ap_ST_fsm_pp0_stage1 = 5'd2;
parameter    ap_ST_fsm_pp0_stage2 = 5'd4;
parameter    ap_ST_fsm_pp0_stage3 = 5'd8;
parameter    ap_ST_fsm_pp0_stage4 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] sext_ln27;
input  [31:0] B_local_load_2;
input  [10:0] add_ln28;
output  [10:0] A_local_address0;
output   A_local_ce0;
input  [31:0] A_local_q0;
input  [31:0] select_ln27;
output  [5:0] X_local_address0;
output   X_local_ce0;
input  [31:0] X_local_q0;
output  [31:0] sub5618_i_out;
output   sub5618_i_out_ap_vld;
output  [31:0] grp_fu_339_p_din0;
output  [31:0] grp_fu_339_p_din1;
output  [1:0] grp_fu_339_p_opcode;
input  [31:0] grp_fu_339_p_dout0;
output   grp_fu_339_p_ce;
output  [31:0] grp_fu_1156_p_din0;
output  [31:0] grp_fu_1156_p_din1;
input  [31:0] grp_fu_1156_p_dout0;
output   grp_fu_1156_p_ce;

reg ap_idle;
reg A_local_ce0;
reg X_local_ce0;
reg sub5618_i_out_ap_vld;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state5_pp0_stage4_iter0;
wire    ap_block_state10_pp0_stage4_iter1;
wire    ap_block_pp0_stage4_subdone;
reg   [0:0] icmp_ln27_reg_211;
reg    ap_condition_exit_pp0_iter0_stage4;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state6_pp0_stage0_iter1;
wire    ap_block_state11_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [63:0] j_2_reg_201;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state7_pp0_stage1_iter1;
wire    ap_block_state12_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [0:0] icmp_ln27_fu_149_p2;
reg   [0:0] icmp_ln27_reg_211_pp0_iter1_reg;
reg   [31:0] A_local_load_reg_220;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_state8_pp0_stage2_iter1;
wire    ap_block_state13_pp0_stage2_iter2;
wire    ap_block_pp0_stage2_11001;
reg   [31:0] X_local_load_reg_225;
reg   [31:0] mul53_i_reg_230;
reg   [31:0] sub56_i_reg_240;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage2_subdone;
wire   [63:0] zext_ln28_fu_140_p1;
wire    ap_block_pp0_stage1;
reg   [31:0] sub5618_i_fu_40;
reg   [31:0] ap_sig_allocacmp_sub5618_i_load_1;
wire    ap_block_pp0_stage2;
wire    ap_loop_init;
reg   [63:0] j_fu_44;
wire   [63:0] add_ln27_fu_154_p2;
wire  signed [63:0] sext_ln27_cast_fu_113_p1;
wire    ap_block_pp0_stage2_01001;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage3;
wire   [10:0] trunc_ln28_fu_131_p1;
wire   [10:0] add_ln28_1_fu_135_p2;
wire   [31:0] trunc_ln27_fu_145_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
wire    ap_block_pp0_stage4_11001;
reg    ap_condition_exit_pp0_iter1_stage2;
reg    ap_idle_pp0_0to0;
reg   [4:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to2;
reg    ap_done_pending_pp0;
wire    ap_block_pp0_stage1_subdone;
wire    ap_block_state4_pp0_stage3_iter0;
wire    ap_block_state9_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_block_pp0_stage2_00001;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

solve_linear_equations_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage4),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage4)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage4_subdone) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage4_subdone) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to0 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter1_stage2))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage4_11001) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            j_fu_44 <= sext_ln27_cast_fu_113_p1;
        end else if (((icmp_ln27_reg_211 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            j_fu_44 <= add_ln27_fu_154_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        sub5618_i_fu_40 <= B_local_load_2;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        sub5618_i_fu_40 <= sub56_i_reg_240;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln27_reg_211 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        A_local_load_reg_220 <= A_local_q0;
        X_local_load_reg_225 <= X_local_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        icmp_ln27_reg_211 <= icmp_ln27_fu_149_p2;
        icmp_ln27_reg_211_pp0_iter1_reg <= icmp_ln27_reg_211;
        j_2_reg_201 <= j_fu_44;
        mul53_i_reg_230 <= grp_fu_1156_p_dout0;
        sub56_i_reg_240 <= grp_fu_339_p_dout0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        A_local_ce0 = 1'b1;
    end else begin
        A_local_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        X_local_ce0 = 1'b1;
    end else begin
        X_local_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln27_reg_211 == 1'd1) & (1'b0 == ap_block_pp0_stage4_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        ap_condition_exit_pp0_iter0_stage4 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage4 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln27_reg_211_pp0_iter1_reg == 1'd1))) begin
        ap_condition_exit_pp0_iter1_stage2 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (~((ap_loop_exit_ready == 1'b0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b0))) begin
        ap_done_pending_pp0 = 1'b1;
    end else begin
        ap_done_pending_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to2 = 1'b1;
    end else begin
        ap_idle_pp0_1to2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage4_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_sig_allocacmp_sub5618_i_load_1 = sub56_i_reg_240;
    end else begin
        ap_sig_allocacmp_sub5618_i_load_1 = sub5618_i_fu_40;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln27_reg_211_pp0_iter1_reg == 1'd1))) begin
        sub5618_i_out_ap_vld = 1'b1;
    end else begin
        sub5618_i_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_done_pending_pp0 == 1'b0) & (ap_idle_pp0_1to2 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if (((ap_idle_pp0_0to0 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter1_stage2))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_local_address0 = zext_ln28_fu_140_p1;

assign X_local_address0 = j_fu_44;

assign add_ln27_fu_154_p2 = (j_2_reg_201 + 64'd1);

assign add_ln28_1_fu_135_p2 = (add_ln28 + trunc_ln28_fu_131_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage2_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage4;

assign grp_fu_1156_p_ce = 1'b1;

assign grp_fu_1156_p_din0 = A_local_load_reg_220;

assign grp_fu_1156_p_din1 = X_local_load_reg_225;

assign grp_fu_339_p_ce = 1'b1;

assign grp_fu_339_p_din0 = ap_sig_allocacmp_sub5618_i_load_1;

assign grp_fu_339_p_din1 = mul53_i_reg_230;

assign grp_fu_339_p_opcode = 2'd1;

assign icmp_ln27_fu_149_p2 = ((trunc_ln27_fu_145_p1 == select_ln27) ? 1'b1 : 1'b0);

assign sext_ln27_cast_fu_113_p1 = $signed(sext_ln27);

assign sub5618_i_out = sub5618_i_fu_40;

assign trunc_ln27_fu_145_p1 = j_fu_44[31:0];

assign trunc_ln28_fu_131_p1 = j_fu_44[10:0];

assign zext_ln28_fu_140_p1 = add_ln28_1_fu_135_p2;

endmodule //solve_linear_equations_solve_linear_equations_Pipeline_VITIS_LOOP_27_5
