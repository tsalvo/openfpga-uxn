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
-- Submodules: 106
entity sta2_0CLK_44f2ccf6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_44f2ccf6;
architecture arch of sta2_0CLK_44f2ccf6 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2481_c6_2648]
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2481_c1_1683]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2481_c2_ef2c]
signal t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2482_c3_c436[uxn_opcodes_h_l2482_c3_c436]
signal printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2486_c11_0755]
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal n16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2486_c7_1c41]
signal t16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_126b]
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2489_c7_1ca8]
signal t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_79d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2494_c7_3a8c]
signal t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2497_c11_5fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2497_c7_7223]
signal n16_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c7_7223]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2497_c7_7223]
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c7_7223]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c7_7223]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c7_7223]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c7_7223]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c7_7223]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2497_c7_7223]
signal t16_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2498_c3_8fc0]
signal BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2501_c11_8335]
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2501_c7_b6bf]
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_9311]
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal n16_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2504_c7_64f8]
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_f3a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal n16_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_1cad]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_7e59]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_7ca4]
signal n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_7ca4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2512_c7_7ca4]
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_7ca4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_7ca4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_7ca4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_7ca4]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2513_c3_b981]
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2515_c30_b94d]
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2518_c31_12df]
signal CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_b8dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2520_c7_15cb]
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_15cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_15cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_15cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2520_c7_15cb]
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2522_c22_36b9]
signal BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_30b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2525_c7_8535]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_8535]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_left,
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_right,
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_return_output);

-- n16_MUX_uxn_opcodes_h_l2481_c2_ef2c
n16_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- t16_MUX_uxn_opcodes_h_l2481_c2_ef2c
t16_MUX_uxn_opcodes_h_l2481_c2_ef2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond,
t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue,
t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse,
t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

-- printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436
printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436 : entity work.printf_uxn_opcodes_h_l2482_c3_c436_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_left,
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_right,
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output);

-- n16_MUX_uxn_opcodes_h_l2486_c7_1c41
n16_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
n16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- t16_MUX_uxn_opcodes_h_l2486_c7_1c41
t16_MUX_uxn_opcodes_h_l2486_c7_1c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond,
t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue,
t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse,
t16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_left,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_right,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output);

-- n16_MUX_uxn_opcodes_h_l2489_c7_1ca8
n16_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- t16_MUX_uxn_opcodes_h_l2489_c7_1ca8
t16_MUX_uxn_opcodes_h_l2489_c7_1ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond,
t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue,
t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse,
t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output);

-- n16_MUX_uxn_opcodes_h_l2494_c7_3a8c
n16_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- t16_MUX_uxn_opcodes_h_l2494_c7_3a8c
t16_MUX_uxn_opcodes_h_l2494_c7_3a8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond,
t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue,
t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse,
t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output);

-- n16_MUX_uxn_opcodes_h_l2497_c7_7223
n16_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
n16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
n16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
n16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- t16_MUX_uxn_opcodes_h_l2497_c7_7223
t16_MUX_uxn_opcodes_h_l2497_c7_7223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2497_c7_7223_cond,
t16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue,
t16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse,
t16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0
BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_left,
BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_right,
BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_left,
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_right,
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output);

-- n16_MUX_uxn_opcodes_h_l2501_c7_b6bf
n16_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_left,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_right,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output);

-- n16_MUX_uxn_opcodes_h_l2504_c7_64f8
n16_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
n16_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_1cad
n16_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_7ca4
n16_MUX_uxn_opcodes_h_l2512_c7_7ca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981
BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_left,
BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_right,
BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d
sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_ins,
sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_x,
sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_y,
sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2518_c31_12df
CONST_SR_8_uxn_opcodes_h_l2518_c31_12df : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_x,
CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond,
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_left,
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_right,
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_return_output,
 n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output,
 n16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 t16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output,
 n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output,
 n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output,
 n16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 t16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output,
 n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output,
 n16_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output,
 sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2483_c3_ed31 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_3721 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_d7a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_2ce5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_41a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_4e83 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_d3e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_ba8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2509_c7_1cad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2518_c21_9121_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2522_c3_5d11 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_c64c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2490_l2498_l2513_l2505_DUPLICATE_7bb0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2530_l2477_DUPLICATE_3ecc_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_d7a2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_d7a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_ba8f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_ba8f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_3721 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_3721;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2483_c3_ed31 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2483_c3_ed31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_4e83 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_4e83;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_right := to_unsigned(9, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_y := to_signed(-4, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_41a1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_41a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_2ce5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_2ce5;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_d3e4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_d3e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_9311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_left;
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output := BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_79d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_7e59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c11_5fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_b8dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2515_c30_b94d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_ins;
     sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_x;
     sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_return_output := sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_30b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2522_c22_36b9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_126b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2509_c7_1cad_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2481_c6_2648] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_left;
     BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output := BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2501_c11_8335] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_left;
     BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output := BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output := result.u8_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2523_c21_c64c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_c64c_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2486_c11_0755] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_left;
     BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output := BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2490_l2498_l2513_l2505_DUPLICATE_7bb0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2490_l2498_l2513_l2505_DUPLICATE_7bb0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_f3a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_2648_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_0755_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_126b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_79d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_5fb7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_8335_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_9311_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_f3a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_7e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_b8dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_30b2_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2522_c3_5d11 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_36b9_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2490_l2498_l2513_l2505_DUPLICATE_7bb0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2490_l2498_l2513_l2505_DUPLICATE_7bb0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2490_l2498_l2513_l2505_DUPLICATE_7bb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_c64c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2489_l2512_l2486_l2509_l2481_l2504_DUPLICATE_8352_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_cf5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2512_l2486_l2509_l2504_DUPLICATE_e1f5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2501_l2497_l2525_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_18a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_9893_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2501_l2497_l2494_l2520_l2489_l2486_l2509_l2481_l2504_DUPLICATE_c8e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_b94d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2522_c3_5d11;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2481_c1_1683] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2520_c7_15cb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output := result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2525_c7_8535] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2520_c7_15cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2498_c3_8fc0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_left;
     BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_return_output := BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_7ca4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_15cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2513_c3_b981] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_left;
     BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output := BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_8535] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_8fc0_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_b981_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2491_l2506_DUPLICATE_8d8a_return_output;
     VAR_printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_1683_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_8535_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_8535_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_15cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     t16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     t16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := t16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_7ca4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;

     -- printf_uxn_opcodes_h_l2482_c3_c436[uxn_opcodes_h_l2482_c3_c436] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2482_c3_c436_uxn_opcodes_h_l2482_c3_c436_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CONST_SR_8[uxn_opcodes_h_l2518_c31_12df] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_return_output := CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_7ca4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_15cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2512_c7_7ca4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_15cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_7ca4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2518_c21_9121] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2518_c21_9121_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_12df_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_7ca4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2518_c21_9121_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := n16_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_7ca4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_7ca4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_1cad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := t16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- n16_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_1cad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     -- t16_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2504_c7_64f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- n16_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     n16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     n16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := n16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_64f8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2501_c7_b6bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_b6bf_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c7_7223] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_7223_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2494_c7_3a8c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := n16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_3a8c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_1ca8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- n16_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_1ca8_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2486_c7_1c41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output := result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_1c41_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2481_c2_ef2c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2530_l2477_DUPLICATE_3ecc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2530_l2477_DUPLICATE_3ecc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_ef2c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2530_l2477_DUPLICATE_3ecc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l2530_l2477_DUPLICATE_3ecc_return_output;
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
