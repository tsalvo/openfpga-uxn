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
-- Submodules: 58
entity rot_0CLK_90cbec6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_90cbec6a;
architecture arch of rot_0CLK_90cbec6a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2505_c6_d73b]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2505_c1_86f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2505_c2_3160]
signal n8_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2505_c2_3160]
signal t8_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2505_c2_3160]
signal l8_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c2_3160]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c2_3160]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c2_3160]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c2_3160]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c2_3160]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2505_c2_3160]
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2506_c3_708c[uxn_opcodes_h_l2506_c3_708c]
signal printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_be7b]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_9f2a]
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_eff2]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal n8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal t8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal l8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_26ec]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_8ba0]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_eb0a]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2520_c30_f60e]
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_ba28]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2525_c7_fa11]
signal l8_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_fa11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_fa11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_fa11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_fa11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_fa11]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_e93c]
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2531_c7_6390]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_6390]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2531_c7_6390]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2531_c7_6390]
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_1196]
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_6554]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_6554]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_return_output);

-- n8_MUX_uxn_opcodes_h_l2505_c2_3160
n8_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
n8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
n8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
n8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- t8_MUX_uxn_opcodes_h_l2505_c2_3160
t8_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
t8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
t8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
t8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- l8_MUX_uxn_opcodes_h_l2505_c2_3160
l8_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
l8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
l8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
l8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_cond,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

-- printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c
printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c : entity work.printf_uxn_opcodes_h_l2506_c3_708c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output);

-- n8_MUX_uxn_opcodes_h_l2510_c7_9f2a
n8_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- t8_MUX_uxn_opcodes_h_l2510_c7_9f2a
t8_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- l8_MUX_uxn_opcodes_h_l2510_c7_9f2a
l8_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output);

-- n8_MUX_uxn_opcodes_h_l2513_c7_26ec
n8_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
n8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- t8_MUX_uxn_opcodes_h_l2513_c7_26ec
t8_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
t8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- l8_MUX_uxn_opcodes_h_l2513_c7_26ec
l8_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
l8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output);

-- n8_MUX_uxn_opcodes_h_l2517_c7_eb0a
n8_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- l8_MUX_uxn_opcodes_h_l2517_c7_eb0a
l8_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e
sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_ins,
sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_x,
sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_y,
sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output);

-- l8_MUX_uxn_opcodes_h_l2525_c7_fa11
l8_MUX_uxn_opcodes_h_l2525_c7_fa11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2525_c7_fa11_cond,
l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue,
l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse,
l8_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_left,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_right,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_cond,
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_left,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_right,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_return_output,
 n8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 t8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 l8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output,
 n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output,
 n8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 t8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 l8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output,
 n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output,
 l8_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_28d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_ecb6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_c598 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2522_c3_23ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_54f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_8cb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2531_c7_6390_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_ad43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_3aca_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_6cd8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2501_l2540_DUPLICATE_111c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_8cb5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_8cb5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_ecb6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_ecb6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_28d3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_28d3;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_c598 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_c598;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2522_c3_23ce := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2522_c3_23ce;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_54f4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_54f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_eff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c6_d73b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_3aca LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_3aca_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_1196] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_left;
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output := BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_ad43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_ad43_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_be7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_ba28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_6cd8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_6cd8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_e93c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2520_c30_f60e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_ins;
     sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_x;
     sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_return_output := sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_8ba0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2531_c7_6390] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2531_c7_6390_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_d73b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_be7b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_eff2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_8ba0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_ba28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_e93c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_1196_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_3aca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_3aca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_3aca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_3aca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_197b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_ad43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_ad43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_ad43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_ad43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_9083_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_6cd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_6cd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_6cd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_6cd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2531_c7_6390_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_f60e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2505_c1_86f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_6554] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_fa11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;

     -- n8_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2525_c7_fa11] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2525_c7_fa11_cond <= VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_cond;
     l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue;
     l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output := l8_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2531_c7_6390] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_return_output := result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;

     -- t8_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := t8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_6554] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2531_c7_6390] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_86f7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6554_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- printf_uxn_opcodes_h_l2506_c3_708c[uxn_opcodes_h_l2506_c3_708c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2506_c3_708c_uxn_opcodes_h_l2506_c3_708c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- l8_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_fa11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2531_c7_6390] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_fa11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;

     -- t8_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- n8_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := n8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_6390] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_6390_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := l8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_fa11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_fa11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;

     -- t8_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     t8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     t8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := t8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- n8_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_fa11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     n8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     n8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := n8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_eb0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_eb0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_26ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     l8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     l8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := l8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- Submodule level 6
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_26ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_9f2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_9f2a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c2_3160] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2501_l2540_DUPLICATE_111c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2501_l2540_DUPLICATE_111c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_3160_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_3160_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2501_l2540_DUPLICATE_111c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2501_l2540_DUPLICATE_111c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
