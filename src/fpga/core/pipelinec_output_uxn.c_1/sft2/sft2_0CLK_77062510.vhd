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
-- Submodules: 71
entity sft2_0CLK_77062510 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_77062510;
architecture arch of sft2_0CLK_77062510 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2125_c6_3fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2125_c1_575d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal n16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal t8_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2125_c2_f79d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2126_c3_79b1[uxn_opcodes_h_l2126_c3_79b1]
signal printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2130_c11_33de]
signal BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2130_c7_3149]
signal n16_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2130_c7_3149]
signal t8_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2130_c7_3149]
signal tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2130_c7_3149]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2130_c7_3149]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2130_c7_3149]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2130_c7_3149]
signal result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2130_c7_3149]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2130_c7_3149]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_fe31]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal n16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal t8_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_4dda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2137_c11_3c35]
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2137_c7_1508]
signal n16_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2137_c7_1508]
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2137_c7_1508]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2137_c7_1508]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2137_c7_1508]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2137_c7_1508]
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2137_c7_1508]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2137_c7_1508]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2139_c3_de1a]
signal CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_daf2]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_e679]
signal n16_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_e679]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_e679]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_e679]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_e679]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_e679]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_e679]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_e679]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2142_c3_eb38]
signal BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2144_c30_6d95]
signal sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2145_c20_69c6]
signal BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2145_c12_ed63]
signal BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2145_c36_d5ed]
signal CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2145_c12_c334]
signal BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_82a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2150_c7_2cb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_2cb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2150_c7_2cb8]
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_2cb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2150_c7_2cb8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2153_c31_db2f]
signal CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_1b76]
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_b25c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_b25c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7
BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_return_output);

-- n16_MUX_uxn_opcodes_h_l2125_c2_f79d
n16_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
n16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- t8_MUX_uxn_opcodes_h_l2125_c2_f79d
t8_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
t8_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d
tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d
result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d
result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

-- printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1
printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1 : entity work.printf_uxn_opcodes_h_l2126_c3_79b1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de
BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_left,
BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_right,
BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output);

-- n16_MUX_uxn_opcodes_h_l2130_c7_3149
n16_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
n16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
n16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
n16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- t8_MUX_uxn_opcodes_h_l2130_c7_3149
t8_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
t8_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
t8_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
t8_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2130_c7_3149
tmp16_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149
result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149
result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149
result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149
result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149
result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c7_4dda
n16_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- t8_MUX_uxn_opcodes_h_l2133_c7_4dda
t8_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
t8_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda
tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_left,
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_right,
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output);

-- n16_MUX_uxn_opcodes_h_l2137_c7_1508
n16_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
n16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
n16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
n16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2137_c7_1508
tmp16_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508
result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a
CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_x,
CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_e679
n16_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_e679
tmp16_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38
BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_left,
BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_right,
BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95
sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_ins,
sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_x,
sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_y,
sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6
BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_left,
BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_right,
BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63
BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_left,
BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_right,
BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed
CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_x,
CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334
BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_left,
BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_right,
BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f
CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_x,
CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_left,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_right,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_return_output,
 n16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 t8_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output,
 n16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 t8_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 t8_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output,
 n16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output,
 CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output,
 sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_return_output,
 CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_2f0f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2131_c3_9387 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_1cb7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_7487 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_09bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_24cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_ccdd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2138_l2142_DUPLICATE_ca3b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2137_DUPLICATE_e90a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2160_l2120_DUPLICATE_fbae_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_1cb7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_1cb7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_2f0f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_2f0f;
     VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2131_c3_9387 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2131_c3_9387;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_7487 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_7487;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_24cd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_24cd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2153_c31_db2f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_return_output := CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2145_c20_69c6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_left;
     BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_return_output := BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_82a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2130_c11_33de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_fe31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2137_c11_3c35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_left;
     BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output := BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2145_c36_d5ed] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_return_output := CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2144_c30_6d95] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_ins;
     sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_x;
     sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_return_output := sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_1b76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2137_DUPLICATE_e90a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2137_DUPLICATE_e90a_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2138_l2142_DUPLICATE_ca3b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2138_l2142_DUPLICATE_ca3b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2125_c6_3fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_daf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2145_c20_69c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c6_3fb7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2130_c11_33de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_fe31_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_3c35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_daf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_1b76_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2138_l2142_DUPLICATE_ca3b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2138_l2142_DUPLICATE_ca3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2141_l2137_l2133_l2130_l2125_DUPLICATE_d3e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2141_l2137_l2133_l2130_l2155_DUPLICATE_34f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_80f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_l2155_DUPLICATE_f2b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2137_DUPLICATE_e90a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2137_DUPLICATE_e90a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2150_l2137_l2133_l2130_l2125_DUPLICATE_8f04_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_right := VAR_CONST_SR_4_uxn_opcodes_h_l2145_c36_d5ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2144_c30_6d95_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2153_c21_ccdd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_ccdd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_db2f_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_2cb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2150_c7_2cb8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2139_c3_de1a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_return_output := CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2142_c3_eb38] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_left;
     BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output := BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2125_c1_575d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := t8_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_b25c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_b25c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2142_c3_eb38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_ccdd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2139_c3_de1a_return_output;
     VAR_printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2125_c1_575d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_b25c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_2cb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- t8_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     t8_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     t8_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := t8_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2150_c7_2cb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2145_c12_ed63] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_left;
     BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_return_output := BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2150_c7_2cb8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- printf_uxn_opcodes_h_l2126_c3_79b1[uxn_opcodes_h_l2126_c3_79b1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2126_c3_79b1_uxn_opcodes_h_l2126_c3_79b1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2145_c12_ed63_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_2cb8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2145_c12_c334] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_left;
     BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output := BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- t8_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := t8_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- n16_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     n16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     n16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := n16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2148_c21_09bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_09bb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2145_c12_c334_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- n16_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := n16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_09bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     -- n16_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     n16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     n16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := n16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_e679] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_e679_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2137_c7_1508] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_return_output := result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := n16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2137_c7_1508_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_4dda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_4dda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2130_c7_3149] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_return_output := result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2130_c7_3149_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2125_c2_f79d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2160_l2120_DUPLICATE_fbae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2160_l2120_DUPLICATE_fbae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c2_f79d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2160_l2120_DUPLICATE_fbae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2160_l2120_DUPLICATE_fbae_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
