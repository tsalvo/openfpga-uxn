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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 58
entity sft_0CLK_007f81f8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_007f81f8;
architecture arch of sft_0CLK_007f81f8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2352_c6_b27e]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal n8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal t8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2352_c2_88b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_7414]
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2357_c7_9448]
signal n8_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2357_c7_9448]
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2357_c7_9448]
signal t8_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_9448]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2357_c7_9448]
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_9448]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_9448]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_9448]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_9448]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_2f0f]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c7_ca8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_11fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal n8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_2f95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2367_c11_3083]
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2367_c7_2341]
signal n8_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2367_c7_2341]
signal tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c7_2341]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2367_c7_2341]
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c7_2341]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c7_2341]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c7_2341]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c7_2341]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2370_c30_0e91]
signal sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2371_c18_6b17]
signal BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2371_c11_0e4d]
signal BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2371_c34_dbab]
signal CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2371_c11_e273]
signal BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_37a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_88e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_88e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_88e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e
BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output);

-- n8_MUX_uxn_opcodes_h_l2352_c2_88b4
n8_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
n8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4
tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- t8_MUX_uxn_opcodes_h_l2352_c2_88b4
t8_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
t8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4
result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4
result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_left,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_right,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output);

-- n8_MUX_uxn_opcodes_h_l2357_c7_9448
n8_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
n8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
n8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
n8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2357_c7_9448
tmp8_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- t8_MUX_uxn_opcodes_h_l2357_c7_9448
t8_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
t8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
t8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
t8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output);

-- n8_MUX_uxn_opcodes_h_l2360_c7_ca8a
n8_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a
tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- t8_MUX_uxn_opcodes_h_l2360_c7_ca8a
t8_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output);

-- n8_MUX_uxn_opcodes_h_l2364_c7_2f95
n8_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
n8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95
tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_left,
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_right,
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output);

-- n8_MUX_uxn_opcodes_h_l2367_c7_2341
n8_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
n8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
n8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
n8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2367_c7_2341
tmp8_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91
sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_ins,
sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_x,
sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_y,
sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17
BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_left,
BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_right,
BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d
BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_left,
BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_right,
BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab
CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_x,
CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273
BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_left,
BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_right,
BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output,
 n8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 t8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output,
 n8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 t8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output,
 n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output,
 n8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output,
 n8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output,
 sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_return_output,
 CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_44c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_bb73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_db9d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_cfe4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_138c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_c7_2341_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2382_l2348_DUPLICATE_bd00_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_cfe4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_cfe4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_138c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_138c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_db9d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_db9d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_bb73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_bb73;
     VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_44c4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_44c4;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_left := VAR_phase;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2370_c30_0e91] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_ins;
     sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_x;
     sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_return_output := sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_7414] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_left;
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output := BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c6_b27e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_11fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2367_c11_3083] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_left;
     BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output := BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_37a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2371_c18_6b17] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_left;
     BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_return_output := BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_2f0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_c7_2341_return_output := result.stack_address_sp_offset;

     -- CONST_SR_4[uxn_opcodes_h_l2371_c34_dbab] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_return_output := CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c18_6b17_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c6_b27e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7414_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_2f0f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_11fe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3083_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_37a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_b81f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2376_l2367_l2364_l2360_l2357_DUPLICATE_5202_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_948e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2376_l2364_l2360_l2357_l2352_DUPLICATE_fc73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2352_DUPLICATE_9c4f_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_right := VAR_CONST_SR_4_uxn_opcodes_h_l2371_c34_dbab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_c7_2341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2370_c30_0e91_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_88e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_88e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_88e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output;

     -- t8_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- n8_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     n8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     n8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := n8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2371_c11_0e4d] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_left;
     BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_return_output := BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2371_c11_0e4d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_88e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- t8_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     t8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     t8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := t8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2371_c11_e273] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_left;
     BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output := BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output;

     -- n8_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := n8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2371_c11_e273_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- t8_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := t8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2367_c7_2341] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_return_output := result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2367_c7_2341_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     n8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     n8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := n8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_2f95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_2f95_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2360_c7_ca8a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_cond;
     tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output := tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := n8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2360_c7_ca8a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2357_c7_9448] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_cond;
     tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output := tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_9448_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2352_c2_88b4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_cond;
     tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output := tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;

     -- Submodule level 8
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2382_l2348_DUPLICATE_bd00 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2382_l2348_DUPLICATE_bd00_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2352_c2_88b4_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2382_l2348_DUPLICATE_bd00_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2382_l2348_DUPLICATE_bd00_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
