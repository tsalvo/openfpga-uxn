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
-- Submodules: 91
entity gth2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_c96e1a89;
architecture arch of gth2_0CLK_c96e1a89 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1952_c6_65fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1952_c1_d55f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1952_c2_639a]
signal n16_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1952_c2_639a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1952_c2_639a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1952_c2_639a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1952_c2_639a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1952_c2_639a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1952_c2_639a]
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1952_c2_639a]
signal t16_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1953_c3_7768[uxn_opcodes_h_l1953_c3_7768]
signal printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_a994]
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1957_c7_7a0e]
signal t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_1efe]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal n16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1960_c7_fed6]
signal t16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_d2fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal n16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1965_c7_02a7]
signal t16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_1590]
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal n16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1968_c7_57c4]
signal t16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1969_c3_079a]
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_088e]
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1972_c7_94ef]
signal n16_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_94ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_94ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1972_c7_94ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_94ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_94ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_94ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_af31]
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1975_c7_1921]
signal n16_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_1921]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_1921]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_1921]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_1921]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_1921]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1975_c7_1921]
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1980_c11_d2ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1980_c7_a190]
signal n16_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1980_c7_a190]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1980_c7_a190]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1980_c7_a190]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1980_c7_a190]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1980_c7_a190]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1980_c7_a190]
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_8e6e]
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1983_c7_e427]
signal n16_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_e427]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_e427]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_e427]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_e427]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_e427]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1983_c7_e427]
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1984_c3_e393]
signal BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1986_c30_fd28]
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1989_c21_84de]
signal BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1989_c21_96e1]
signal MUX_uxn_opcodes_h_l1989_c21_96e1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1989_c21_96e1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1989_c21_96e1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1989_c21_96e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1991_c11_034b]
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1991_c7_687d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c7_687d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c7_687d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_return_output);

-- n16_MUX_uxn_opcodes_h_l1952_c2_639a
n16_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
n16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
n16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
n16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- t16_MUX_uxn_opcodes_h_l1952_c2_639a
t16_MUX_uxn_opcodes_h_l1952_c2_639a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1952_c2_639a_cond,
t16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue,
t16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse,
t16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

-- printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768
printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768 : entity work.printf_uxn_opcodes_h_l1953_c3_7768_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_left,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_right,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output);

-- n16_MUX_uxn_opcodes_h_l1957_c7_7a0e
n16_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- t16_MUX_uxn_opcodes_h_l1957_c7_7a0e
t16_MUX_uxn_opcodes_h_l1957_c7_7a0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond,
t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue,
t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse,
t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output);

-- n16_MUX_uxn_opcodes_h_l1960_c7_fed6
n16_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
n16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- t16_MUX_uxn_opcodes_h_l1960_c7_fed6
t16_MUX_uxn_opcodes_h_l1960_c7_fed6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond,
t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue,
t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse,
t16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output);

-- n16_MUX_uxn_opcodes_h_l1965_c7_02a7
n16_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
n16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- t16_MUX_uxn_opcodes_h_l1965_c7_02a7
t16_MUX_uxn_opcodes_h_l1965_c7_02a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond,
t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue,
t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse,
t16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_left,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_right,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output);

-- n16_MUX_uxn_opcodes_h_l1968_c7_57c4
n16_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
n16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- t16_MUX_uxn_opcodes_h_l1968_c7_57c4
t16_MUX_uxn_opcodes_h_l1968_c7_57c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond,
t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue,
t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse,
t16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a
BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_left,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_right,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_left,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_right,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output);

-- n16_MUX_uxn_opcodes_h_l1972_c7_94ef
n16_MUX_uxn_opcodes_h_l1972_c7_94ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1972_c7_94ef_cond,
n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue,
n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse,
n16_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_left,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_right,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output);

-- n16_MUX_uxn_opcodes_h_l1975_c7_1921
n16_MUX_uxn_opcodes_h_l1975_c7_1921 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1975_c7_1921_cond,
n16_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue,
n16_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse,
n16_MUX_uxn_opcodes_h_l1975_c7_1921_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_cond,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output);

-- n16_MUX_uxn_opcodes_h_l1980_c7_a190
n16_MUX_uxn_opcodes_h_l1980_c7_a190 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1980_c7_a190_cond,
n16_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue,
n16_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse,
n16_MUX_uxn_opcodes_h_l1980_c7_a190_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_cond,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_left,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_right,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output);

-- n16_MUX_uxn_opcodes_h_l1983_c7_e427
n16_MUX_uxn_opcodes_h_l1983_c7_e427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1983_c7_e427_cond,
n16_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue,
n16_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse,
n16_MUX_uxn_opcodes_h_l1983_c7_e427_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_cond,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393
BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_left,
BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_right,
BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28
sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_ins,
sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_x,
sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_y,
sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de
BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_left,
BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_right,
BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_return_output);

-- MUX_uxn_opcodes_h_l1989_c21_96e1
MUX_uxn_opcodes_h_l1989_c21_96e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1989_c21_96e1_cond,
MUX_uxn_opcodes_h_l1989_c21_96e1_iftrue,
MUX_uxn_opcodes_h_l1989_c21_96e1_iffalse,
MUX_uxn_opcodes_h_l1989_c21_96e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_left,
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_right,
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_return_output,
 n16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 t16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output,
 n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output,
 n16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 t16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output,
 n16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 t16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output,
 n16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 t16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output,
 n16_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output,
 n16_MUX_uxn_opcodes_h_l1975_c7_1921_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output,
 n16_MUX_uxn_opcodes_h_l1980_c7_a190_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output,
 n16_MUX_uxn_opcodes_h_l1983_c7_e427_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output,
 sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_return_output,
 MUX_uxn_opcodes_h_l1989_c21_96e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1954_c3_0640 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_afdb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_8453 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_c862 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_a9b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_9b2c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_ab12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_8c9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_c45a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1983_c7_e427_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1969_l1976_l1984_DUPLICATE_18f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1997_l1948_DUPLICATE_3113_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_c862 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_c862;
     VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_c45a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_c45a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1954_c3_0640 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1954_c3_0640;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_9b2c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_9b2c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_8453 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_8453;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_8c9f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_8c9f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_a9b0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_a9b0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_ab12 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_ab12;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_afdb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_afdb;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1991_c11_034b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1983_c7_e427_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_1590] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_left;
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output := BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_a994] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_left;
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output := BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1980_c11_d2ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1969_l1976_l1984_DUPLICATE_18f2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1969_l1976_l1984_DUPLICATE_18f2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_8e6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_af31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_left;
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output := BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_d2fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_1efe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_088e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1986_c30_fd28] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_ins;
     sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_x;
     sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_return_output := sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1952_c6_65fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c6_65fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_a994_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_1efe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_d2fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_1590_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_088e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_af31_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_d2ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_8e6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_034b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1969_l1976_l1984_DUPLICATE_18f2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1969_l1976_l1984_DUPLICATE_18f2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1961_l1969_l1976_l1984_DUPLICATE_18f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_2eb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1975_l1972_l1968_l1965_l1991_l1960_l1983_l1957_l1980_DUPLICATE_8958_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_4c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1991_l1960_l1957_l1980_DUPLICATE_8962_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1952_l1975_l1972_l1968_l1965_l1960_l1983_l1957_l1980_DUPLICATE_d47b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1983_c7_e427_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1986_c30_fd28_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c7_687d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1969_c3_079a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_left;
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_return_output := BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c7_687d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1991_c7_687d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1952_c1_d55f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1984_c3_e393] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_left;
     BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output := BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_079a_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1984_c3_e393_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1962_l1977_DUPLICATE_fa6f_return_output;
     VAR_printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1952_c1_d55f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_687d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c7_687d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_687d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;

     -- t16_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := t16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1980_c7_a190] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;

     -- n16_MUX[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1983_c7_e427_cond <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_cond;
     n16_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue;
     n16_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_return_output := n16_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1980_c7_a190] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;

     -- printf_uxn_opcodes_h_l1953_c3_7768[uxn_opcodes_h_l1953_c3_7768] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1953_c3_7768_uxn_opcodes_h_l1953_c3_7768_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_GT[uxn_opcodes_h_l1989_c21_84de] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_left;
     BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_return_output := BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1989_c21_84de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1980_c7_a190] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;

     -- MUX[uxn_opcodes_h_l1989_c21_96e1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1989_c21_96e1_cond <= VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_cond;
     MUX_uxn_opcodes_h_l1989_c21_96e1_iftrue <= VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_iftrue;
     MUX_uxn_opcodes_h_l1989_c21_96e1_iffalse <= VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_return_output := MUX_uxn_opcodes_h_l1989_c21_96e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1980_c7_a190] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1980_c7_a190] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_1921] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;

     -- n16_MUX[uxn_opcodes_h_l1980_c7_a190] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1980_c7_a190_cond <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_cond;
     n16_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue;
     n16_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_return_output := n16_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;

     -- t16_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := t16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_1921] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue := VAR_MUX_uxn_opcodes_h_l1989_c21_96e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1983_c7_e427] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_return_output := result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_1921] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;

     -- t16_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := t16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_94ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1975_c7_1921] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1975_c7_1921_cond <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_cond;
     n16_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue;
     n16_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_return_output := n16_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_94ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_1921] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_1921] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e427_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1980_c7_a190] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_return_output := result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;

     -- t16_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1972_c7_94ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_94ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1972_c7_94ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1972_c7_94ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_cond;
     n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue;
     n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output := n16_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_94ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_a190_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1975_c7_1921] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_return_output := result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     t16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     t16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := t16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := n16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_1921_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := n16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_94ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_94ef_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_57c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := n16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_57c4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1965_c7_02a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_02a7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_fed6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     n16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     n16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := n16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_fed6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_7a0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_7a0e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1952_c2_639a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1997_l1948_DUPLICATE_3113 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1997_l1948_DUPLICATE_3113_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c2_639a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1952_c2_639a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1997_l1948_DUPLICATE_3113_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1997_l1948_DUPLICATE_3113_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
