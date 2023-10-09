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
-- Submodules: 136
entity ovr2_0CLK_084aa6da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_084aa6da;
architecture arch of ovr2_0CLK_084aa6da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l364_c6_dd2b]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l364_c1_70a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l364_c2_7b16]
signal t16_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l364_c2_7b16]
signal result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c2_7b16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l364_c2_7b16]
signal result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c2_7b16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c2_7b16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c2_7b16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c2_7b16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l364_c2_7b16]
signal n16_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l365_c3_7852[uxn_opcodes_h_l365_c3_7852]
signal printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_845e]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l370_c7_e348]
signal t16_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l370_c7_e348]
signal result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_e348]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l370_c7_e348]
signal result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l370_c7_e348]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_e348]
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_e348]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_e348]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l370_c7_e348]
signal n16_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l373_c11_327b]
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal t16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l373_c7_2bb8]
signal n16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l378_c11_495c]
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal t16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l378_c7_6cc9]
signal n16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l381_c11_455a]
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l381_c7_10ca]
signal t16_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l381_c7_10ca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l381_c7_10ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l381_c7_10ca]
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l381_c7_10ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l381_c7_10ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_10ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_10ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l381_c7_10ca]
signal n16_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l382_c3_3ed6]
signal BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l385_c11_d097]
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l385_c7_8f88]
signal result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l385_c7_8f88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l385_c7_8f88]
signal result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l385_c7_8f88]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l385_c7_8f88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l385_c7_8f88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l385_c7_8f88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l385_c7_8f88]
signal n16_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_83f0]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l388_c7_90d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l388_c7_90d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l388_c7_90d4]
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l388_c7_90d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l388_c7_90d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_90d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_90d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l388_c7_90d4]
signal n16_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l393_c11_4506]
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l393_c7_5705]
signal result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l393_c7_5705]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l393_c7_5705]
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l393_c7_5705]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_5705]
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_5705]
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_5705]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l393_c7_5705]
signal n16_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l396_c11_6278]
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l396_c7_1d8c]
signal n16_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l397_c3_0528]
signal BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l400_c32_4ccd]
signal BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l400_c32_8c73]
signal BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l400_c32_1a0c]
signal MUX_uxn_opcodes_h_l400_c32_1a0c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l400_c32_1a0c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l400_c32_1a0c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l400_c32_1a0c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l402_c11_75dc]
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_8d53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l402_c7_8d53]
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_8d53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_8d53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_8d53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l408_c11_a3f8]
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_1bf3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l408_c7_1bf3]
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_1bf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l408_c7_1bf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l412_c11_c171]
signal BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l412_c7_9457]
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l412_c7_9457]
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l412_c7_9457]
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l412_c7_9457]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l416_c11_ed1a]
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_6028]
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l416_c7_6028]
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_6028]
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_6028]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l418_c34_4cb5]
signal CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l420_c11_7126]
signal BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l420_c7_f5ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l420_c7_f5ed]
signal result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l420_c7_f5ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l420_c7_f5ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l424_c11_b98e]
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_6e09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l424_c7_6e09]
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_6e09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_6e09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l428_c11_7ddb]
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_1fcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_1fcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b
BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_return_output);

-- t16_MUX_uxn_opcodes_h_l364_c2_7b16
t16_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
t16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
t16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
t16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16
result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16
result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16
result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16
result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- n16_MUX_uxn_opcodes_h_l364_c2_7b16
n16_MUX_uxn_opcodes_h_l364_c2_7b16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l364_c2_7b16_cond,
n16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue,
n16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse,
n16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

-- printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852
printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852 : entity work.printf_uxn_opcodes_h_l365_c3_7852_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e
BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output);

-- t16_MUX_uxn_opcodes_h_l370_c7_e348
t16_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l370_c7_e348_cond,
t16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
t16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
t16_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348
result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348
result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_cond,
result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348
result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- n16_MUX_uxn_opcodes_h_l370_c7_e348
n16_MUX_uxn_opcodes_h_l370_c7_e348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l370_c7_e348_cond,
n16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue,
n16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse,
n16_MUX_uxn_opcodes_h_l370_c7_e348_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b
BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_left,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_right,
BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output);

-- t16_MUX_uxn_opcodes_h_l373_c7_2bb8
t16_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
t16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- n16_MUX_uxn_opcodes_h_l373_c7_2bb8
n16_MUX_uxn_opcodes_h_l373_c7_2bb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond,
n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue,
n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse,
n16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c
BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_left,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_right,
BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output);

-- t16_MUX_uxn_opcodes_h_l378_c7_6cc9
t16_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
t16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9
result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9
result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- n16_MUX_uxn_opcodes_h_l378_c7_6cc9
n16_MUX_uxn_opcodes_h_l378_c7_6cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond,
n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue,
n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse,
n16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a
BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_left,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_right,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output);

-- t16_MUX_uxn_opcodes_h_l381_c7_10ca
t16_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
t16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
t16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
t16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca
result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- n16_MUX_uxn_opcodes_h_l381_c7_10ca
n16_MUX_uxn_opcodes_h_l381_c7_10ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l381_c7_10ca_cond,
n16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue,
n16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse,
n16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6
BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_left,
BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_right,
BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097
BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_left,
BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_right,
BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88
result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88
result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88
result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88
result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88
result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- n16_MUX_uxn_opcodes_h_l385_c7_8f88
n16_MUX_uxn_opcodes_h_l385_c7_8f88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l385_c7_8f88_cond,
n16_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue,
n16_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse,
n16_MUX_uxn_opcodes_h_l385_c7_8f88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0
BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4
result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4
result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4
result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- n16_MUX_uxn_opcodes_h_l388_c7_90d4
n16_MUX_uxn_opcodes_h_l388_c7_90d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l388_c7_90d4_cond,
n16_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue,
n16_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse,
n16_MUX_uxn_opcodes_h_l388_c7_90d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506
BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_left,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_right,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705
result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705
result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705
result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_cond,
result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705
result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- n16_MUX_uxn_opcodes_h_l393_c7_5705
n16_MUX_uxn_opcodes_h_l393_c7_5705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l393_c7_5705_cond,
n16_MUX_uxn_opcodes_h_l393_c7_5705_iftrue,
n16_MUX_uxn_opcodes_h_l393_c7_5705_iffalse,
n16_MUX_uxn_opcodes_h_l393_c7_5705_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278
BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_left,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_right,
BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c
result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c
result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c
result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- n16_MUX_uxn_opcodes_h_l396_c7_1d8c
n16_MUX_uxn_opcodes_h_l396_c7_1d8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l396_c7_1d8c_cond,
n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue,
n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse,
n16_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l397_c3_0528
BIN_OP_OR_uxn_opcodes_h_l397_c3_0528 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_left,
BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_right,
BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd
BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_left,
BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_right,
BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73
BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_left,
BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_right,
BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_return_output);

-- MUX_uxn_opcodes_h_l400_c32_1a0c
MUX_uxn_opcodes_h_l400_c32_1a0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l400_c32_1a0c_cond,
MUX_uxn_opcodes_h_l400_c32_1a0c_iftrue,
MUX_uxn_opcodes_h_l400_c32_1a0c_iffalse,
MUX_uxn_opcodes_h_l400_c32_1a0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc
BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_left,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_right,
BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_cond,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8
BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_left,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_right,
BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3
result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_cond,
result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171
BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_left,
BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_right,
BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457
result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_cond,
result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_left,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_right,
BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028
result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_cond,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_return_output);

-- CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5
CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_x,
CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126
BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_left,
BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_right,
BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed
result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed
result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e
BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_left,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_right,
BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09
result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_cond,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb
BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_left,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_right,
BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67
CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3
CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_return_output,
 t16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 n16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output,
 t16_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 n16_MUX_uxn_opcodes_h_l370_c7_e348_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output,
 t16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 n16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output,
 t16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 n16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output,
 t16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 n16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output,
 BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 n16_MUX_uxn_opcodes_h_l385_c7_8f88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 n16_MUX_uxn_opcodes_h_l388_c7_90d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 n16_MUX_uxn_opcodes_h_l393_c7_5705_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 n16_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_return_output,
 BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_return_output,
 MUX_uxn_opcodes_h_l400_c32_1a0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_return_output,
 CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_feb8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6bdb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l376_c3_eb46 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_c3db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l383_c3_92f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_82a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_a373 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_fb3c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_3d1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l409_c3_5c81 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l413_c3_87f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l414_c24_20ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l417_c3_0991 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l418_c24_27de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l421_c3_7ef6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_e464 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l382_l374_l389_l397_DUPLICATE_f095_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l396_l424_DUPLICATE_a1dc_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l422_l406_DUPLICATE_81c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l410_l426_DUPLICATE_c39e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l433_l360_DUPLICATE_cbbd_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_c3db := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l379_c3_c3db;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_e464 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l425_c3_e464;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l383_c3_92f4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l383_c3_92f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_3d1b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l405_c3_3d1b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6bdb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l371_c3_6bdb;
     VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l413_c3_87f5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l413_c3_87f5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_feb8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_feb8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_right := to_unsigned(13, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l376_c3_eb46 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l376_c3_eb46;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_fb3c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_fb3c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_82a5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_82a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l417_c3_0991 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l417_c3_0991;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l409_c3_5c81 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l409_c3_5c81;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l421_c3_7ef6 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l421_c3_7ef6;
     VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_a373 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l391_c3_a373;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l382_l374_l389_l397_DUPLICATE_f095 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l382_l374_l389_l397_DUPLICATE_f095_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l396_c11_6278] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_left;
     BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output := BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l373_c11_327b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_left;
     BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output := BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l402_c11_75dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l400_c32_4ccd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_left;
     BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_return_output := BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_845e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l412_c11_c171] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_left;
     BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output := BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l420_c11_7126] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_left;
     BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output := BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l424_c11_b98e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_left;
     BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output := BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l385_c11_d097] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_left;
     BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output := BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l396_l424_DUPLICATE_a1dc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l396_l424_DUPLICATE_a1dc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l378_c11_495c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_left;
     BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output := BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_83f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l414_c24_20ce] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l414_c24_20ce_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l428_c11_7ddb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_left;
     BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output := BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output := result.sp_relative_shift;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l418_c34_4cb5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_return_output := CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c6_dd2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l381_c11_455a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_left;
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output := BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l393_c11_4506] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_left;
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output := BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l408_c11_a3f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l422_l406_DUPLICATE_81c6 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l422_l406_DUPLICATE_81c6_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l416_c11_ed1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_left := VAR_BIN_OP_AND_uxn_opcodes_h_l400_c32_4ccd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c6_dd2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_845e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l373_c11_327b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l378_c11_495c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_455a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_d097_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_83f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_4506_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l396_c11_6278_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l402_c11_75dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l408_c11_a3f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l412_c11_c171_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l416_c11_ed1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l420_c11_7126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l424_c11_b98e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l428_c11_7ddb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l382_l374_l389_l397_DUPLICATE_f095_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l382_l374_l389_l397_DUPLICATE_f095_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l382_l374_l389_l397_DUPLICATE_f095_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l414_c24_20ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l422_l406_DUPLICATE_81c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l422_l406_DUPLICATE_81c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l385_DUPLICATE_715e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l381_l420_l428_l416_l412_l396_l408_l393_l378_l402_l388_l373_l424_l385_DUPLICATE_1aad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l370_l381_l364_l393_l378_l402_l388_l373_l385_DUPLICATE_6faa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l370_l381_l396_l393_l378_l388_l373_l385_DUPLICATE_2e0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l370_l381_l420_l364_l416_l412_l396_l408_l393_l378_l428_l388_l373_l424_l385_DUPLICATE_0f1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l396_l424_DUPLICATE_a1dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l396_l424_DUPLICATE_a1dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l370_l381_l364_l396_l393_l378_l388_l373_l424_l385_DUPLICATE_b361_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l418_c24_27de] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l418_c24_27de_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l418_c34_4cb5_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l428_c7_1fcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l397_c3_0528] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_left;
     BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_return_output := BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l364_c1_70a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l402_c7_8d53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l428_c7_1fcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l382_c3_3ed6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_left;
     BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_return_output := BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l424_c7_6e09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l400_c32_8c73] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_left;
     BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_return_output := BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l410_l426_DUPLICATE_c39e LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l410_l426_DUPLICATE_c39e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l426_l410_DUPLICATE_afa3_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l400_c32_8c73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l382_c3_3ed6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l397_c3_0528_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l418_c24_27de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l410_l426_DUPLICATE_c39e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l410_l426_DUPLICATE_c39e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l390_l375_DUPLICATE_3d67_return_output;
     VAR_printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l364_c1_70a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l428_c7_1fcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;
     -- t16_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     t16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     t16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := t16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l424_c7_6e09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l424_c7_6e09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- printf_uxn_opcodes_h_l365_c3_7852[uxn_opcodes_h_l365_c3_7852] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l365_c3_7852_uxn_opcodes_h_l365_c3_7852_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l420_c7_f5ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l424_c7_6e09] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_cond;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_return_output := result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;

     -- n16_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := n16_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- MUX[uxn_opcodes_h_l400_c32_1a0c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l400_c32_1a0c_cond <= VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_cond;
     MUX_uxn_opcodes_h_l400_c32_1a0c_iftrue <= VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_iftrue;
     MUX_uxn_opcodes_h_l400_c32_1a0c_iffalse <= VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_return_output := MUX_uxn_opcodes_h_l400_c32_1a0c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue := VAR_MUX_uxn_opcodes_h_l400_c32_1a0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_n16_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l424_c7_6e09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l416_c7_6028] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l420_c7_f5ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l420_c7_f5ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l420_c7_f5ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := t16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- n16_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     n16_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     n16_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_return_output := n16_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l416_c7_6028_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l420_c7_f5ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     -- t16_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := t16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     n16_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     n16_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := n16_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l412_c7_9457] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l416_c7_6028] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l416_c7_6028] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_cond;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_return_output := result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l416_c7_6028] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_n16_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l416_c7_6028_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l416_c7_6028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l412_c7_9457_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l416_c7_6028_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_t16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l412_c7_9457] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l412_c7_9457] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- t16_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     t16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     t16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_return_output := t16_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- n16_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     n16_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     n16_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := n16_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l408_c7_1bf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l412_c7_9457] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_cond;
     result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_return_output := result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_n16_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l412_c7_9457_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l412_c7_9457_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l412_c7_9457_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_t16_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l408_c7_1bf3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output := result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l402_c7_8d53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l408_c7_1bf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l408_c7_1bf3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;

     -- t16_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     t16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     t16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := t16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- n16_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     n16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     n16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := n16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l408_c7_1bf3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- n16_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := n16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l402_c7_8d53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l402_c7_8d53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l402_c7_8d53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_return_output := result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l402_c7_8d53_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- n16_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := n16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l396_c7_1d8c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output := result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_n16_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l396_c7_1d8c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- n16_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     n16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     n16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_return_output := n16_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l393_c7_5705] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_cond;
     result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_return_output := result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_n16_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l393_c7_5705_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     n16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     n16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := n16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l388_c7_90d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l388_c7_90d4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l385_c7_8f88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l385_c7_8f88_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_10ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l381_c7_10ca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l378_c7_6cc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l378_c7_6cc9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l373_c7_2bb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l373_c7_2bb8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_return_output := result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_e348] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l370_c7_e348_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c2_7b16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l433_l360_DUPLICATE_cbbd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l433_l360_DUPLICATE_cbbd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c2_7b16_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c2_7b16_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l433_l360_DUPLICATE_cbbd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l433_l360_DUPLICATE_cbbd_return_output;
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
