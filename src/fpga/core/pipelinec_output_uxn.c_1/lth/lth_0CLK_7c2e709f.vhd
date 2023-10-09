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
-- Submodules: 65
entity lth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth_0CLK_7c2e709f;
architecture arch of lth_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2151_c6_0bb4]
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2151_c1_42dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal t8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal n8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c2_5b24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2152_c3_40d5[uxn_opcodes_h_l2152_c3_40d5]
signal printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2157_c11_8731]
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal t8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal n8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2157_c7_77b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2160_c11_b9c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2160_c7_e298]
signal t8_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2160_c7_e298]
signal n8_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2160_c7_e298]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2160_c7_e298]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2160_c7_e298]
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2160_c7_e298]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2160_c7_e298]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2160_c7_e298]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2160_c7_e298]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2164_c11_9972]
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal n8_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2164_c7_2d38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2167_c11_b540]
signal BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2167_c7_c859]
signal n8_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2167_c7_c859]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2167_c7_c859]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2167_c7_c859]
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2167_c7_c859]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2167_c7_c859]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2167_c7_c859]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2167_c7_c859]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2171_c32_965b]
signal BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2171_c32_c614]
signal BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2171_c32_04b6]
signal MUX_uxn_opcodes_h_l2171_c32_04b6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2171_c32_04b6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2171_c32_04b6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2171_c32_04b6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_fbf2]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_b4ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2173_c7_b4ac]
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_b4ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_b4ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_b4ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2177_c24_8927]
signal BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2177_c24_0db2]
signal MUX_uxn_opcodes_h_l2177_c24_0db2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2177_c24_0db2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2177_c24_0db2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2177_c24_0db2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2179_c11_0002]
signal BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2179_c7_fb1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2179_c7_fb1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4
BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_left,
BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_right,
BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_return_output);

-- t8_MUX_uxn_opcodes_h_l2151_c2_5b24
t8_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
t8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- n8_MUX_uxn_opcodes_h_l2151_c2_5b24
n8_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
n8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24
result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24
result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

-- printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5
printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5 : entity work.printf_uxn_opcodes_h_l2152_c3_40d5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_left,
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_right,
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output);

-- t8_MUX_uxn_opcodes_h_l2157_c7_77b2
t8_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
t8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- n8_MUX_uxn_opcodes_h_l2157_c7_77b2
n8_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
n8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output);

-- t8_MUX_uxn_opcodes_h_l2160_c7_e298
t8_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
t8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
t8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
t8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- n8_MUX_uxn_opcodes_h_l2160_c7_e298
n8_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
n8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
n8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
n8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_left,
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_right,
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output);

-- n8_MUX_uxn_opcodes_h_l2164_c7_2d38
n8_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
n8_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540
BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_left,
BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_right,
BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output);

-- n8_MUX_uxn_opcodes_h_l2167_c7_c859
n8_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
n8_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
n8_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
n8_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859
result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b
BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_left,
BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_right,
BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614
BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_left,
BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_right,
BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_return_output);

-- MUX_uxn_opcodes_h_l2171_c32_04b6
MUX_uxn_opcodes_h_l2171_c32_04b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2171_c32_04b6_cond,
MUX_uxn_opcodes_h_l2171_c32_04b6_iftrue,
MUX_uxn_opcodes_h_l2171_c32_04b6_iffalse,
MUX_uxn_opcodes_h_l2171_c32_04b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927
BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927 : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_left,
BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_right,
BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_return_output);

-- MUX_uxn_opcodes_h_l2177_c24_0db2
MUX_uxn_opcodes_h_l2177_c24_0db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2177_c24_0db2_cond,
MUX_uxn_opcodes_h_l2177_c24_0db2_iftrue,
MUX_uxn_opcodes_h_l2177_c24_0db2_iffalse,
MUX_uxn_opcodes_h_l2177_c24_0db2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_left,
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_right,
BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_return_output,
 t8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 n8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output,
 t8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 n8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output,
 t8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 n8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output,
 n8_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output,
 n8_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_return_output,
 MUX_uxn_opcodes_h_l2171_c32_04b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_return_output,
 MUX_uxn_opcodes_h_l2177_c24_0db2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_b002 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_1355 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_1d7c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_50ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2176_c3_6e6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2157_l2167_l2160_DUPLICATE_bdf8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2167_l2173_DUPLICATE_ab6e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2184_l2147_DUPLICATE_6eae_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_b002 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_b002;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2176_c3_6e6f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2176_c3_6e6f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_50ec := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_50ec;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_1355 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_1355;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_1d7c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_1d7c;
     VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2157_c11_8731] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_left;
     BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output := BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2177_c24_8927] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_left;
     BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_return_output := BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2171_c32_965b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_left;
     BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_return_output := BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2164_c11_9972] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_left;
     BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output := BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2179_c11_0002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_left;
     BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output := BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2151_c6_0bb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_fbf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2167_l2173_DUPLICATE_ab6e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2167_l2173_DUPLICATE_ab6e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2167_c11_b540] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_left;
     BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output := BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2160_c11_b9c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2157_l2167_l2160_DUPLICATE_bdf8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2157_l2167_l2160_DUPLICATE_bdf8_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2171_c32_965b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c6_0bb4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_8731_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_b9c5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_9972_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c11_b540_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_fbf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2179_c11_0002_return_output;
     VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2177_c24_8927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2167_l2164_l2160_l2157_l2151_DUPLICATE_57c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2179_l2173_l2167_l2164_l2160_l2157_DUPLICATE_891d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2173_l2164_l2160_l2157_l2151_DUPLICATE_0ab8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2157_l2167_l2160_DUPLICATE_bdf8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2157_l2167_l2160_DUPLICATE_bdf8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2157_l2167_l2160_DUPLICATE_bdf8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2157_l2167_l2160_DUPLICATE_bdf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2179_l2167_l2164_l2160_l2157_l2151_DUPLICATE_c379_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2167_l2173_DUPLICATE_ab6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2167_l2173_DUPLICATE_ab6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2173_l2167_l2164_l2160_l2157_l2151_DUPLICATE_8ced_return_output;
     -- n8_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     n8_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     n8_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := n8_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- MUX[uxn_opcodes_h_l2177_c24_0db2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2177_c24_0db2_cond <= VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_cond;
     MUX_uxn_opcodes_h_l2177_c24_0db2_iftrue <= VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_iftrue;
     MUX_uxn_opcodes_h_l2177_c24_0db2_iffalse <= VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_return_output := MUX_uxn_opcodes_h_l2177_c24_0db2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_b4ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2179_c7_fb1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     t8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     t8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := t8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2171_c32_c614] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_left;
     BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_return_output := BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2151_c1_42dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2179_c7_fb1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_b4ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2171_c32_c614_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue := VAR_MUX_uxn_opcodes_h_l2177_c24_0db2_return_output;
     VAR_printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2151_c1_42dc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2179_c7_fb1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     -- MUX[uxn_opcodes_h_l2171_c32_04b6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2171_c32_04b6_cond <= VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_cond;
     MUX_uxn_opcodes_h_l2171_c32_04b6_iftrue <= VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_iftrue;
     MUX_uxn_opcodes_h_l2171_c32_04b6_iffalse <= VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_return_output := MUX_uxn_opcodes_h_l2171_c32_04b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- n8_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := n8_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2173_c7_b4ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- printf_uxn_opcodes_h_l2152_c3_40d5[uxn_opcodes_h_l2152_c3_40d5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2152_c3_40d5_uxn_opcodes_h_l2152_c3_40d5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := t8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_b4ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_b4ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue := VAR_MUX_uxn_opcodes_h_l2171_c32_04b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_b4ac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- t8_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := t8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2167_c7_c859] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;

     -- n8_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     n8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     n8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := n8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c7_c859_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;
     -- n8_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := n8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2164_c7_2d38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_2d38_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- n8_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := n8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2160_c7_e298] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_e298_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2157_c7_77b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_77b2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c2_5b24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2184_l2147_DUPLICATE_6eae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2184_l2147_DUPLICATE_6eae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c2_5b24_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2184_l2147_DUPLICATE_6eae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2184_l2147_DUPLICATE_6eae_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
