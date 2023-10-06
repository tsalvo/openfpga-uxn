-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 42
entity jmp_0CLK_6481cb28 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_6481cb28;
architecture arch of jmp_0CLK_6481cb28 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l670_c6_2ffe]
signal BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l670_c1_8015]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal t8_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l670_c2_ebfd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l671_c3_c83e[uxn_opcodes_h_l671_c3_c83e]
signal printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l676_c11_39a4]
signal BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l676_c7_15f0]
signal t8_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c7_15f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l676_c7_15f0]
signal result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c7_15f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c7_15f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l676_c7_15f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c7_15f0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l676_c7_15f0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l679_c11_402c]
signal BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l679_c7_b06a]
signal t8_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l679_c7_b06a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l679_c7_b06a]
signal result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l679_c7_b06a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l679_c7_b06a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l679_c7_b06a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l679_c7_b06a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l683_c32_8f32]
signal BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l683_c32_258e]
signal BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l683_c32_eb15]
signal MUX_uxn_opcodes_h_l683_c32_eb15_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l683_c32_eb15_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l683_c32_eb15_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l683_c32_eb15_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l685_c11_38f9]
signal BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c7_e76f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l685_c7_e76f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l685_c7_e76f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l685_c7_e76f]
signal result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l688_c15_5f0d]
signal BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l690_c11_b22f]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_87a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_87a9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_89b6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.pc := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe
BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_left,
BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_right,
BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_return_output);

-- t8_MUX_uxn_opcodes_h_l670_c2_ebfd
t8_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
t8_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd
result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd
result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

-- printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e
printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e : entity work.printf_uxn_opcodes_h_l671_c3_c83e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4
BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_left,
BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_right,
BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output);

-- t8_MUX_uxn_opcodes_h_l676_c7_15f0
t8_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
t8_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
t8_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
t8_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l676_c7_15f0
result_pc_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0
result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c
BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_left,
BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_right,
BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output);

-- t8_MUX_uxn_opcodes_h_l679_c7_b06a
t8_MUX_uxn_opcodes_h_l679_c7_b06a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l679_c7_b06a_cond,
t8_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue,
t8_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse,
t8_MUX_uxn_opcodes_h_l679_c7_b06a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a
result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l679_c7_b06a
result_pc_MUX_uxn_opcodes_h_l679_c7_b06a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_cond,
result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue,
result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse,
result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a
result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32
BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_left,
BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_right,
BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l683_c32_258e
BIN_OP_GT_uxn_opcodes_h_l683_c32_258e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_left,
BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_right,
BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_return_output);

-- MUX_uxn_opcodes_h_l683_c32_eb15
MUX_uxn_opcodes_h_l683_c32_eb15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l683_c32_eb15_cond,
MUX_uxn_opcodes_h_l683_c32_eb15_iftrue,
MUX_uxn_opcodes_h_l683_c32_eb15_iffalse,
MUX_uxn_opcodes_h_l683_c32_eb15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9
BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_left,
BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_right,
BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l685_c7_e76f
result_pc_MUX_uxn_opcodes_h_l685_c7_e76f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_cond,
result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue,
result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse,
result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d
BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_left,
BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_right,
BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_return_output,
 t8_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output,
 t8_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output,
 t8_MUX_uxn_opcodes_h_l679_c7_b06a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output,
 result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_return_output,
 BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_return_output,
 MUX_uxn_opcodes_h_l683_c32_eb15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_return_output,
 result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_779c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_8fcd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l676_c7_15f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l680_c8_19d7_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l683_c32_eb15_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l683_c32_eb15_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l683_c32_eb15_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l683_c32_eb15_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l688_c3_65d6 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l670_l685_l676_DUPLICATE_7a6d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l670_l685_l676_l679_DUPLICATE_8ae2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l670_l676_l679_DUPLICATE_5105_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l670_l676_l690_l679_DUPLICATE_28b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l685_l676_l690_l679_DUPLICATE_c0e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l676_l679_DUPLICATE_bade_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l695_l666_DUPLICATE_76cd_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_779c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_779c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_8fcd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_8fcd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l683_c32_eb15_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l683_c32_eb15_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_right := to_unsigned(4, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l670_l685_l676_DUPLICATE_7a6d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l670_l685_l676_DUPLICATE_7a6d_return_output := result.is_sp_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l680_c8_19d7] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l680_c8_19d7_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c11_b22f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l685_c11_38f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l670_l685_l676_l679_DUPLICATE_8ae2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l670_l685_l676_l679_DUPLICATE_8ae2_return_output := result.pc;

     -- BIN_OP_PLUS[uxn_opcodes_h_l688_c15_5f0d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l670_l676_l690_l679_DUPLICATE_28b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l670_l676_l690_l679_DUPLICATE_28b5_return_output := result.is_pc_updated;

     -- BIN_OP_AND[uxn_opcodes_h_l683_c32_8f32] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_left;
     BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_return_output := BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l679_c11_402c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_left;
     BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output := BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l676_c11_39a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l676_l679_DUPLICATE_bade LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l676_l679_DUPLICATE_bade_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l685_l676_l690_l679_DUPLICATE_c0e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l685_l676_l690_l679_DUPLICATE_c0e5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l670_c6_2ffe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_left;
     BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output := BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l670_l676_l679_DUPLICATE_5105 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l670_l676_l679_DUPLICATE_5105_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l676_c7_15f0_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l683_c32_8f32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_2ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_39a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_402c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_38f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_b22f_return_output;
     VAR_result_pc_uxn_opcodes_h_l688_c3_65d6 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l688_c15_5f0d_return_output)),16);
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l680_c8_19d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l670_l676_l679_DUPLICATE_5105_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l670_l676_l679_DUPLICATE_5105_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l670_l676_l679_DUPLICATE_5105_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l670_l685_l676_l679_DUPLICATE_8ae2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l670_l685_l676_l679_DUPLICATE_8ae2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l670_l685_l676_l679_DUPLICATE_8ae2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l670_l685_l676_l679_DUPLICATE_8ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l685_l676_l690_l679_DUPLICATE_c0e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l685_l676_l690_l679_DUPLICATE_c0e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l685_l676_l690_l679_DUPLICATE_c0e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l685_l676_l690_l679_DUPLICATE_c0e5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l670_l676_l690_l679_DUPLICATE_28b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l670_l676_l690_l679_DUPLICATE_28b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l670_l676_l690_l679_DUPLICATE_28b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l670_l676_l690_l679_DUPLICATE_28b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l670_l685_l676_DUPLICATE_7a6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l670_l685_l676_DUPLICATE_7a6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l670_l685_l676_DUPLICATE_7a6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l676_l679_DUPLICATE_bade_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l676_l679_DUPLICATE_bade_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l676_c7_15f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue := VAR_result_pc_uxn_opcodes_h_l688_c3_65d6;
     -- t8_MUX[uxn_opcodes_h_l679_c7_b06a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l679_c7_b06a_cond <= VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_cond;
     t8_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue;
     t8_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_return_output := t8_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l685_c7_e76f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_cond;
     result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_return_output := result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c7_e76f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l679_c7_b06a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_87a9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l683_c32_258e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_left;
     BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_return_output := BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l670_c1_8015] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_87a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l683_c32_eb15_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l683_c32_258e_return_output;
     VAR_printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_8015_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_87a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_87a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l679_c7_b06a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_cond;
     result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_return_output := result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;

     -- MUX[uxn_opcodes_h_l683_c32_eb15] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l683_c32_eb15_cond <= VAR_MUX_uxn_opcodes_h_l683_c32_eb15_cond;
     MUX_uxn_opcodes_h_l683_c32_eb15_iftrue <= VAR_MUX_uxn_opcodes_h_l683_c32_eb15_iftrue;
     MUX_uxn_opcodes_h_l683_c32_eb15_iffalse <= VAR_MUX_uxn_opcodes_h_l683_c32_eb15_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l683_c32_eb15_return_output := MUX_uxn_opcodes_h_l683_c32_eb15_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l685_c7_e76f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l685_c7_e76f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l679_c7_b06a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     t8_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     t8_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := t8_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- printf_uxn_opcodes_h_l671_c3_c83e[uxn_opcodes_h_l671_c3_c83e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l671_c3_c83e_uxn_opcodes_h_l671_c3_c83e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue := VAR_MUX_uxn_opcodes_h_l683_c32_eb15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l685_c7_e76f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l679_c7_b06a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l679_c7_b06a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l679_c7_b06a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;

     -- t8_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := t8_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_b06a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l676_c7_15f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_15f0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l670_c2_ebfd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l695_l666_DUPLICATE_76cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l695_l666_DUPLICATE_76cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_89b6(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l670_c2_ebfd_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l695_l666_DUPLICATE_76cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l695_l666_DUPLICATE_76cd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
