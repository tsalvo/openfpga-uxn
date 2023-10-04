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
-- Submodules: 123
entity eor2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_201aeef3;
architecture arch of eor2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1031_c6_6aa6]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_dcb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal t16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1031_c2_6c66]
signal n16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1032_c3_b42f[uxn_opcodes_h_l1032_c3_b42f]
signal printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_9ed9]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal t16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1037_c7_73fb]
signal n16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_3d2d]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1040_c7_f240]
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1040_c7_f240]
signal t16_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1040_c7_f240]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1040_c7_f240]
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1040_c7_f240]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1040_c7_f240]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1040_c7_f240]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1040_c7_f240]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1040_c7_f240]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1040_c7_f240]
signal n16_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_17d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal t16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1045_c7_9da3]
signal n16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_db6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal t16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1048_c7_91d1]
signal n16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1049_c3_69e4]
signal BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_3803]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1052_c7_d4db]
signal n16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_d64b]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_48a3]
signal n16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_23b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1060_c7_2a54]
signal n16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_cb3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1063_c7_7c8b]
signal n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1064_c3_e4db]
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1065_c11_dbe0]
signal BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1068_c32_208f]
signal BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1068_c32_332e]
signal BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1068_c32_15b6]
signal MUX_uxn_opcodes_h_l1068_c32_15b6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1068_c32_15b6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1068_c32_15b6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1068_c32_15b6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1070_c11_7803]
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1070_c7_efea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1070_c7_efea]
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1070_c7_efea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1070_c7_efea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1070_c7_efea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1076_c11_6222]
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c7_9a23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1076_c7_9a23]
signal result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c7_9a23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c7_9a23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1078_c34_a06b]
signal CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_cb0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_2c39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_2c39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6
BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66
tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- t16_MUX_uxn_opcodes_h_l1031_c2_6c66
t16_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
t16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66
result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66
result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- n16_MUX_uxn_opcodes_h_l1031_c2_6c66
n16_MUX_uxn_opcodes_h_l1031_c2_6c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond,
n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue,
n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse,
n16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

-- printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f
printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f : entity work.printf_uxn_opcodes_h_l1032_c3_b42f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb
tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- t16_MUX_uxn_opcodes_h_l1037_c7_73fb
t16_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
t16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- n16_MUX_uxn_opcodes_h_l1037_c7_73fb
n16_MUX_uxn_opcodes_h_l1037_c7_73fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond,
n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue,
n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse,
n16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1040_c7_f240
tmp16_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- t16_MUX_uxn_opcodes_h_l1040_c7_f240
t16_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
t16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
t16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
t16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- n16_MUX_uxn_opcodes_h_l1040_c7_f240
n16_MUX_uxn_opcodes_h_l1040_c7_f240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1040_c7_f240_cond,
n16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue,
n16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse,
n16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3
tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- t16_MUX_uxn_opcodes_h_l1045_c7_9da3
t16_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
t16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- n16_MUX_uxn_opcodes_h_l1045_c7_9da3
n16_MUX_uxn_opcodes_h_l1045_c7_9da3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond,
n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue,
n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse,
n16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1
tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- t16_MUX_uxn_opcodes_h_l1048_c7_91d1
t16_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
t16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- n16_MUX_uxn_opcodes_h_l1048_c7_91d1
n16_MUX_uxn_opcodes_h_l1048_c7_91d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond,
n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue,
n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse,
n16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4
BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_left,
BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_right,
BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db
tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- n16_MUX_uxn_opcodes_h_l1052_c7_d4db
n16_MUX_uxn_opcodes_h_l1052_c7_d4db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond,
n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue,
n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse,
n16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3
tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_48a3
n16_MUX_uxn_opcodes_h_l1055_c7_48a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54
tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- n16_MUX_uxn_opcodes_h_l1060_c7_2a54
n16_MUX_uxn_opcodes_h_l1060_c7_2a54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond,
n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue,
n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse,
n16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b
tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- n16_MUX_uxn_opcodes_h_l1063_c7_7c8b
n16_MUX_uxn_opcodes_h_l1063_c7_7c8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond,
n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue,
n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse,
n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db
BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_left,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_right,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0
BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_left,
BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_right,
BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f
BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_left,
BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_right,
BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e
BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_left,
BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_right,
BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_return_output);

-- MUX_uxn_opcodes_h_l1068_c32_15b6
MUX_uxn_opcodes_h_l1068_c32_15b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1068_c32_15b6_cond,
MUX_uxn_opcodes_h_l1068_c32_15b6_iftrue,
MUX_uxn_opcodes_h_l1068_c32_15b6_iffalse,
MUX_uxn_opcodes_h_l1068_c32_15b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_left,
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_right,
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_left,
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_right,
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23
result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_cond,
result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b
CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_x,
CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa
CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 t16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 n16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 t16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 n16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 t16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 n16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 t16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 n16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 t16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 n16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output,
 tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 n16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 n16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_return_output,
 MUX_uxn_opcodes_h_l1068_c32_15b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output,
 CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1034_c3_dd10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1038_c3_0321 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1043_c3_fa70 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_4cc2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1050_c3_e066 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_1186 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_24dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_9d29 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_4dd3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1074_c24_2777_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_6c58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1078_c24_5190_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1049_l1056_l1041_l1064_DUPLICATE_a3b2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1076_l1063_DUPLICATE_b8e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1085_l1027_DUPLICATE_893a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_4dd3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_4dd3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_24dd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_24dd;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1043_c3_fa70 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1043_c3_fa70;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_6c58 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_6c58;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1038_c3_0321 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1038_c3_0321;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1050_c3_e066 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1050_c3_e066;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_9d29 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_9d29;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1034_c3_dd10 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1034_c3_dd10;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_4cc2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_4cc2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_1186 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_1186;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1078_c34_a06b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_return_output := CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_3803] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1070_c11_7803] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_left;
     BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output := BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_3d2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_cb3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_23b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1068_c32_208f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_left;
     BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_return_output := BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1049_l1056_l1041_l1064_DUPLICATE_a3b2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1049_l1056_l1041_l1064_DUPLICATE_a3b2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c6_6aa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1076_l1063_DUPLICATE_b8e3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1076_l1063_DUPLICATE_b8e3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_cb0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_db6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_d64b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1076_c11_6222] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_left;
     BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output := BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_9ed9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_17d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1074_c24_2777] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1074_c24_2777_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c32_208f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c6_6aa6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9ed9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_3d2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_17d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_db6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3803_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_d64b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_23b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_cb3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_7803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_6222_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_cb0e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1049_l1056_l1041_l1064_DUPLICATE_a3b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1049_l1056_l1041_l1064_DUPLICATE_a3b2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1049_l1056_l1041_l1064_DUPLICATE_a3b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1074_c24_2777_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_3fbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1080_l1052_l1076_l1048_l1070_l1045_l1063_l1040_DUPLICATE_026f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1048_l1070_l1045_l1040_DUPLICATE_e7ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1037_l1060_l1055_l1052_l1048_l1045_l1063_l1040_DUPLICATE_c3bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1080_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_3636_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1076_l1063_DUPLICATE_b8e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1076_l1063_DUPLICATE_b8e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1037_l1060_l1031_l1055_l1052_l1076_l1048_l1045_l1063_l1040_DUPLICATE_fc7f_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1078_c24_5190] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1078_c24_5190_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1078_c34_a06b_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1064_c3_e4db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_left;
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output := BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1049_c3_69e4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_left;
     BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_return_output := BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1068_c32_332e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_left;
     BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_return_output := BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c7_9a23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_2c39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1070_c7_efea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_dcb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_2c39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1068_c32_332e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1049_c3_69e4_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_e4db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1078_c24_5190_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1057_l1042_DUPLICATE_fcfa_return_output;
     VAR_printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_dcb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_2c39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;
     -- n16_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1076_c7_9a23] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output := result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1070_c7_efea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c7_9a23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- printf_uxn_opcodes_h_l1032_c3_b42f[uxn_opcodes_h_l1032_c3_b42f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1032_c3_b42f_uxn_opcodes_h_l1032_c3_b42f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_XOR[uxn_opcodes_h_l1065_c11_dbe0] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_left;
     BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_return_output := BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := t16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- MUX[uxn_opcodes_h_l1068_c32_15b6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1068_c32_15b6_cond <= VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_cond;
     MUX_uxn_opcodes_h_l1068_c32_15b6_iftrue <= VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_iftrue;
     MUX_uxn_opcodes_h_l1068_c32_15b6_iffalse <= VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_return_output := MUX_uxn_opcodes_h_l1068_c32_15b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c7_9a23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1065_c11_dbe0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue := VAR_MUX_uxn_opcodes_h_l1068_c32_15b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1076_c7_9a23_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1070_c7_efea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1070_c7_efea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1070_c7_efea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := t16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := n16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_efea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     t16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     t16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := t16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_7c8b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_7c8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     -- n16_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := n16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1060_c7_2a54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output := result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := t16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_2a54_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     -- t16_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := t16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- n16_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := n16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_48a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_48a3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- n16_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := n16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1052_c7_d4db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output := result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_d4db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     n16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     n16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := n16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_91d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_91d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     -- n16_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := n16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_9da3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_9da3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     -- n16_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := n16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1040_c7_f240] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_f240_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_73fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_73fb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c2_6c66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1085_l1027_DUPLICATE_893a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1085_l1027_DUPLICATE_893a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1031_c2_6c66_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1085_l1027_DUPLICATE_893a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1085_l1027_DUPLICATE_893a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
