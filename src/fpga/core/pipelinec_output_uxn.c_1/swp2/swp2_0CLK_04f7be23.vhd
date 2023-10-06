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
-- Submodules: 128
entity swp2_0CLK_04f7be23 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_04f7be23;
architecture arch of swp2_0CLK_04f7be23 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l3010_c6_be81]
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3010_c1_8ad0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3010_c2_c880]
signal n16_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3010_c2_c880]
signal t16_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c2_c880]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3010_c2_c880]
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c2_c880]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3010_c2_c880]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c2_c880]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c2_c880]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3010_c2_c880]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3011_c3_6e1b[uxn_opcodes_h_l3011_c3_6e1b]
signal printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3016_c11_1ef3]
signal BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal n16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal t16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3016_c7_2fae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_9ffa]
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal n16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal t16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3019_c7_65f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3024_c11_1f76]
signal BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3024_c7_4516]
signal n16_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3024_c7_4516]
signal t16_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3024_c7_4516]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3024_c7_4516]
signal result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3024_c7_4516]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3024_c7_4516]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3024_c7_4516]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3024_c7_4516]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3024_c7_4516]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3027_c11_9c67]
signal BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal n16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal t16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3027_c7_1a89]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3028_c3_dc0f]
signal BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3031_c11_288c]
signal BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3031_c7_e070]
signal n16_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3031_c7_e070]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3031_c7_e070]
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3031_c7_e070]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3031_c7_e070]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3031_c7_e070]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3031_c7_e070]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3031_c7_e070]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3034_c11_c6e1]
signal BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3034_c7_c0c6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3039_c11_e0d5]
signal BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal n16_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3039_c7_30d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3042_c11_9dfe]
signal BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3042_c7_7e8d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3043_c3_5a47]
signal BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3046_c32_5c96]
signal BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3046_c32_3a97]
signal BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3046_c32_24d2]
signal MUX_uxn_opcodes_h_l3046_c32_24d2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3046_c32_24d2_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3046_c32_24d2_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3046_c32_24d2_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3048_c11_4424]
signal BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3048_c7_96c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3048_c7_96c9]
signal result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3048_c7_96c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3048_c7_96c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3048_c7_96c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_99b1]
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3054_c7_4394]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3054_c7_4394]
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3054_c7_4394]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3054_c7_4394]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3054_c7_4394]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3056_c34_0483]
signal CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_3e76]
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3058_c7_2998]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3058_c7_2998]
signal result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3058_c7_2998]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3058_c7_2998]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3058_c7_2998]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_0b28]
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3063_c7_b2ff]
signal result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3063_c7_b2ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3063_c7_b2ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3063_c7_b2ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3065_c34_b3c7]
signal CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_e653]
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3067_c7_9adb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3067_c7_9adb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81
BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_left,
BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_right,
BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_return_output);

-- n16_MUX_uxn_opcodes_h_l3010_c2_c880
n16_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
n16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
n16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
n16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- t16_MUX_uxn_opcodes_h_l3010_c2_c880
t16_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
t16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
t16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
t16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880
result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880
result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880
result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

-- printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b
printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b : entity work.printf_uxn_opcodes_h_l3011_c3_6e1b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_left,
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_right,
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output);

-- n16_MUX_uxn_opcodes_h_l3016_c7_2fae
n16_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
n16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- t16_MUX_uxn_opcodes_h_l3016_c7_2fae
t16_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
t16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_left,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_right,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output);

-- n16_MUX_uxn_opcodes_h_l3019_c7_65f6
n16_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
n16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- t16_MUX_uxn_opcodes_h_l3019_c7_65f6
t16_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
t16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6
result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6
result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6
result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_left,
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_right,
BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output);

-- n16_MUX_uxn_opcodes_h_l3024_c7_4516
n16_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
n16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
n16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
n16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- t16_MUX_uxn_opcodes_h_l3024_c7_4516
t16_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
t16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
t16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
t16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516
result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516
result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516
result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516
result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_left,
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_right,
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output);

-- n16_MUX_uxn_opcodes_h_l3027_c7_1a89
n16_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
n16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- t16_MUX_uxn_opcodes_h_l3027_c7_1a89
t16_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
t16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f
BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_left,
BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_right,
BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c
BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_left,
BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_right,
BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output);

-- n16_MUX_uxn_opcodes_h_l3031_c7_e070
n16_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
n16_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
n16_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
n16_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070
result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1
BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_left,
BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_right,
BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output);

-- n16_MUX_uxn_opcodes_h_l3034_c7_c0c6
n16_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6
result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6
result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6
result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6
result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6
result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5
BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_left,
BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_right,
BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output);

-- n16_MUX_uxn_opcodes_h_l3039_c7_30d9
n16_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
n16_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9
result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9
result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9
result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9
result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9
result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_left,
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_right,
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output);

-- n16_MUX_uxn_opcodes_h_l3042_c7_7e8d
n16_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d
result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d
result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47
BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_left,
BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_right,
BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96
BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_left,
BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_right,
BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97
BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_left,
BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_right,
BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_return_output);

-- MUX_uxn_opcodes_h_l3046_c32_24d2
MUX_uxn_opcodes_h_l3046_c32_24d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3046_c32_24d2_cond,
MUX_uxn_opcodes_h_l3046_c32_24d2_iftrue,
MUX_uxn_opcodes_h_l3046_c32_24d2_iffalse,
MUX_uxn_opcodes_h_l3046_c32_24d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424
BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_left,
BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_right,
BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9
result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9
result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9
result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9
result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_left,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_right,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_cond,
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3056_c34_0483
CONST_SR_8_uxn_opcodes_h_l3056_c34_0483 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_x,
CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_left,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_right,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998
result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998
result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_cond,
result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998
result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998
result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_left,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_right,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff
result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff
result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff
result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7
CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_x,
CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_left,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_right,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb
result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb
result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6
CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_return_output,
 n16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 t16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output,
 n16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 t16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output,
 n16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 t16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output,
 n16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 t16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output,
 n16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 t16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output,
 n16_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output,
 n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output,
 n16_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output,
 n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_return_output,
 MUX_uxn_opcodes_h_l3046_c32_24d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_return_output,
 CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output,
 CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3013_c3_cc01 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3017_c3_32c4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3022_c3_11d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_6ca7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3029_c3_63f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3032_c3_f57d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3037_c3_19a6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3040_c3_5612 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3051_c3_8d77 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3052_c24_af47_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3055_c3_2720 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3056_c24_ec52_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3060_c3_9a1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3061_c24_b85b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3064_c3_bd14 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3065_c24_302a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3020_l3028_l3035_l3043_DUPLICATE_6384_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3063_l3042_DUPLICATE_1739_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3072_l3006_DUPLICATE_f866_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3022_c3_11d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3022_c3_11d0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3029_c3_63f2 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3029_c3_63f2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3013_c3_cc01 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3013_c3_cc01;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_6ca7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_6ca7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3055_c3_2720 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3055_c3_2720;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3060_c3_9a1b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3060_c3_9a1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3064_c3_bd14 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3064_c3_bd14;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3032_c3_f57d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3032_c3_f57d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3017_c3_32c4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3017_c3_32c4;
     VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3051_c3_8d77 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3051_c3_8d77;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3037_c3_19a6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3037_c3_19a6;
     VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3040_c3_5612 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3040_c3_5612;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l3010_c6_be81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_left;
     BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output := BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3024_c11_1f76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_left;
     BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output := BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3031_c11_288c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3039_c11_e0d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3016_c11_1ef3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3061_c24_b85b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3061_c24_b85b_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3020_l3028_l3035_l3043_DUPLICATE_6384 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3020_l3028_l3035_l3043_DUPLICATE_6384_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3048_c11_4424] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_left;
     BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output := BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3056_c34_0483] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_return_output := CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_99b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3065_c34_b3c7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_return_output := CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3052_c24_af47] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3052_c24_af47_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l3027_c11_9c67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_left;
     BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output := BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_e653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_left;
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output := BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l3046_c32_5c96] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_left;
     BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_return_output := BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_0b28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_left;
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output := BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3063_l3042_DUPLICATE_1739 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3063_l3042_DUPLICATE_1739_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_3e76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_left;
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output := BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3042_c11_9dfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3034_c11_c6e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_9ffa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_left;
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output := BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3046_c32_5c96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c6_be81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_1ef3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_9ffa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3024_c11_1f76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_9c67_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c11_288c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3034_c11_c6e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3039_c11_e0d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_9dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3048_c11_4424_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_99b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_3e76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_0b28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_e653_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3020_l3028_l3035_l3043_DUPLICATE_6384_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3020_l3028_l3035_l3043_DUPLICATE_6384_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3020_l3028_l3035_l3043_DUPLICATE_6384_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3052_c24_af47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3061_c24_b85b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3031_l3027_DUPLICATE_7c8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3024_l3048_l3019_l3042_l3016_l3039_l3067_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_6a86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3024_l3019_l3016_l3039_l3010_l3034_l3031_l3058_l3027_l3054_DUPLICATE_45bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3034_l3031_l3027_DUPLICATE_8f15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3067_l3010_l3034_l3063_l3031_l3058_l3027_l3054_DUPLICATE_c0e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3063_l3042_DUPLICATE_1739_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3063_l3042_DUPLICATE_1739_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3024_l3019_l3042_l3016_l3039_l3010_l3034_l3063_l3031_l3027_DUPLICATE_899e_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l3028_c3_dc0f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_left;
     BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_return_output := BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3043_c3_5a47] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_left;
     BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_return_output := BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3063_c7_b2ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3046_c32_3a97] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_left;
     BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_return_output := BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3058_c7_2998] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3010_c1_8ad0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3056_c24_ec52] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3056_c24_ec52_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3056_c34_0483_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3065_c24_302a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3065_c24_302a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3065_c34_b3c7_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3067_c7_9adb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3067_c7_9adb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3046_c32_3a97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3028_c3_dc0f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3043_c3_5a47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3056_c24_ec52_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3065_c24_302a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3021_l3036_DUPLICATE_96e6_return_output;
     VAR_printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3010_c1_8ad0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3067_c7_9adb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3063_c7_b2ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3063_c7_b2ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- t16_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := t16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3054_c7_4394] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3058_c7_2998] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3063_c7_b2ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;

     -- printf_uxn_opcodes_h_l3011_c3_6e1b[uxn_opcodes_h_l3011_c3_6e1b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3011_c3_6e1b_uxn_opcodes_h_l3011_c3_6e1b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l3046_c32_24d2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3046_c32_24d2_cond <= VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_cond;
     MUX_uxn_opcodes_h_l3046_c32_24d2_iftrue <= VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_iftrue;
     MUX_uxn_opcodes_h_l3046_c32_24d2_iffalse <= VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_return_output := MUX_uxn_opcodes_h_l3046_c32_24d2_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue := VAR_MUX_uxn_opcodes_h_l3046_c32_24d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3063_c7_b2ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3058_c7_2998] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_return_output := result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := n16_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- t16_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     t16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     t16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := t16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3058_c7_2998] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3048_c7_96c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3058_c7_2998] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3054_c7_4394] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3058_c7_2998_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     -- t16_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := t16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3054_c7_4394] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3054_c7_4394] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_return_output := result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3054_c7_4394] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3048_c7_96c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_4394_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     -- n16_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     n16_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     n16_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := n16_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- t16_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := t16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3048_c7_96c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3048_c7_96c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3048_c7_96c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3048_c7_96c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     -- t16_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     t16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     t16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := t16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- n16_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := n16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3042_c7_7e8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_7e8d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3039_c7_30d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- n16_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     n16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     n16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := n16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3039_c7_30d9_return_output;
     -- n16_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := n16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3034_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3034_c7_c0c6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- n16_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := n16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3031_c7_e070] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c7_e070_return_output;
     -- n16_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     n16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     n16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := n16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3027_c7_1a89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_1a89_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3024_c7_4516] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3024_c7_4516_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3019_c7_65f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3019_c7_65f6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3016_c7_2fae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output := result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_2fae_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3010_c2_c880] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_return_output := result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3072_l3006_DUPLICATE_f866 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3072_l3006_DUPLICATE_f866_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c2_c880_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3010_c2_c880_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3072_l3006_DUPLICATE_f866_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3072_l3006_DUPLICATE_f866_return_output;
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
