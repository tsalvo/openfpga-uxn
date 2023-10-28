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
-- BIN_OP_EQ[uxn_opcodes_h_l1957_c6_158d]
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1957_c1_bdd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1957_c2_f420]
signal t16_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c2_f420]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1957_c2_f420]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c2_f420]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c2_f420]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1957_c2_f420]
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c2_f420]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1957_c2_f420]
signal n16_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1958_c3_e719[uxn_opcodes_h_l1958_c3_e719]
signal printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_fe88]
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1962_c7_9135]
signal t16_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_9135]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1962_c7_9135]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_9135]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_9135]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1962_c7_9135]
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_9135]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1962_c7_9135]
signal n16_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_35c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal t16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1965_c7_39eb]
signal n16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_c8ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1970_c7_606c]
signal t16_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_606c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1970_c7_606c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_606c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_606c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1970_c7_606c]
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_606c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1970_c7_606c]
signal n16_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1973_c11_e455]
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1973_c7_f289]
signal t16_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1973_c7_f289]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1973_c7_f289]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1973_c7_f289]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1973_c7_f289]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1973_c7_f289]
signal result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1973_c7_f289]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1973_c7_f289]
signal n16_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1974_c3_0831]
signal BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_a68b]
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1977_c7_dfb2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1977_c7_dfb2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_dfb2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_dfb2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1977_c7_dfb2]
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1977_c7_dfb2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1977_c7_dfb2]
signal n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1980_c11_723a]
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1980_c7_6a78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1980_c7_6a78]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1980_c7_6a78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1980_c7_6a78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1980_c7_6a78]
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1980_c7_6a78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1980_c7_6a78]
signal n16_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1985_c11_48da]
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c7_d650]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c7_d650]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c7_d650]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c7_d650]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1985_c7_d650]
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c7_d650]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1985_c7_d650]
signal n16_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1988_c11_a505]
signal BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1988_c7_32cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1988_c7_32cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1988_c7_32cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1988_c7_32cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1988_c7_32cf]
signal result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1988_c7_32cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1988_c7_32cf]
signal n16_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1989_c3_57ad]
signal BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1991_c30_fd59]
signal sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1994_c21_421e]
signal BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1994_c21_849f]
signal MUX_uxn_opcodes_h_l1994_c21_849f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1994_c21_849f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1994_c21_849f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1994_c21_849f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1996_c11_45bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1996_c7_9408]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1996_c7_9408]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1996_c7_9408]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d
BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_left,
BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_right,
BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_return_output);

-- t16_MUX_uxn_opcodes_h_l1957_c2_f420
t16_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
t16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
t16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
t16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420
result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- n16_MUX_uxn_opcodes_h_l1957_c2_f420
n16_MUX_uxn_opcodes_h_l1957_c2_f420 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1957_c2_f420_cond,
n16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue,
n16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse,
n16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

-- printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719
printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719 : entity work.printf_uxn_opcodes_h_l1958_c3_e719_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_left,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_right,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output);

-- t16_MUX_uxn_opcodes_h_l1962_c7_9135
t16_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
t16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
t16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
t16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- n16_MUX_uxn_opcodes_h_l1962_c7_9135
n16_MUX_uxn_opcodes_h_l1962_c7_9135 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1962_c7_9135_cond,
n16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue,
n16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse,
n16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output);

-- t16_MUX_uxn_opcodes_h_l1965_c7_39eb
t16_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
t16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- n16_MUX_uxn_opcodes_h_l1965_c7_39eb
n16_MUX_uxn_opcodes_h_l1965_c7_39eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond,
n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue,
n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse,
n16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output);

-- t16_MUX_uxn_opcodes_h_l1970_c7_606c
t16_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
t16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
t16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
t16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- n16_MUX_uxn_opcodes_h_l1970_c7_606c
n16_MUX_uxn_opcodes_h_l1970_c7_606c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1970_c7_606c_cond,
n16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue,
n16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse,
n16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_left,
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_right,
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output);

-- t16_MUX_uxn_opcodes_h_l1973_c7_f289
t16_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
t16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
t16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
t16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289
result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- n16_MUX_uxn_opcodes_h_l1973_c7_f289
n16_MUX_uxn_opcodes_h_l1973_c7_f289 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1973_c7_f289_cond,
n16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue,
n16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse,
n16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831
BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_left,
BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_right,
BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_left,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_right,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2
result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output);

-- n16_MUX_uxn_opcodes_h_l1977_c7_dfb2
n16_MUX_uxn_opcodes_h_l1977_c7_dfb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond,
n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue,
n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse,
n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_left,
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_right,
BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_cond,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output);

-- n16_MUX_uxn_opcodes_h_l1980_c7_6a78
n16_MUX_uxn_opcodes_h_l1980_c7_6a78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1980_c7_6a78_cond,
n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue,
n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse,
n16_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_left,
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_right,
BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_cond,
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output);

-- n16_MUX_uxn_opcodes_h_l1985_c7_d650
n16_MUX_uxn_opcodes_h_l1985_c7_d650 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1985_c7_d650_cond,
n16_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue,
n16_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse,
n16_MUX_uxn_opcodes_h_l1985_c7_d650_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_left,
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_right,
BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf
result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf
result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf
result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output);

-- n16_MUX_uxn_opcodes_h_l1988_c7_32cf
n16_MUX_uxn_opcodes_h_l1988_c7_32cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1988_c7_32cf_cond,
n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue,
n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse,
n16_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad
BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_left,
BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_right,
BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59
sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_ins,
sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_x,
sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_y,
sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e
BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_left,
BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_right,
BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_return_output);

-- MUX_uxn_opcodes_h_l1994_c21_849f
MUX_uxn_opcodes_h_l1994_c21_849f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1994_c21_849f_cond,
MUX_uxn_opcodes_h_l1994_c21_849f_iftrue,
MUX_uxn_opcodes_h_l1994_c21_849f_iffalse,
MUX_uxn_opcodes_h_l1994_c21_849f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb
BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408
result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408
result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408
result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4
CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_return_output,
 t16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 n16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output,
 t16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 n16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output,
 t16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 n16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output,
 t16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 n16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output,
 t16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 n16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output,
 n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output,
 n16_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output,
 n16_MUX_uxn_opcodes_h_l1985_c7_d650_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output,
 n16_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output,
 sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_return_output,
 MUX_uxn_opcodes_h_l1994_c21_849f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_03ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_1b8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_30bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1971_c3_7446 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_69e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_c679 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1983_c3_9df5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1986_c3_e360 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1993_c3_eeff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1988_c7_32cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c21_849f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c21_849f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c21_849f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c21_849f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1974_l1989_l1966_l1981_DUPLICATE_ddd9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2002_l1953_DUPLICATE_5369_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_03ce := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_03ce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_c679 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1978_c3_c679;
     VAR_MUX_uxn_opcodes_h_l1994_c21_849f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1994_c21_849f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_1b8a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_1b8a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_69e0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1975_c3_69e0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_30bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1968_c3_30bd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1986_c3_e360 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1986_c3_e360;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1971_c3_7446 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1971_c3_7446;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1983_c3_9df5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1983_c3_9df5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1993_c3_eeff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1993_c3_eeff;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_c8ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_fe88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1988_c11_a505] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_left;
     BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output := BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_a68b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1985_c11_48da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1965_c11_35c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1973_c11_e455] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_left;
     BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output := BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1996_c11_45bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1957_c6_158d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1988_c7_32cf_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1980_c11_723a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1974_l1989_l1966_l1981_DUPLICATE_ddd9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1974_l1989_l1966_l1981_DUPLICATE_ddd9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1991_c30_fd59] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_ins;
     sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_x;
     sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_return_output := sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c6_158d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_fe88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1965_c11_35c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_c8ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_e455_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_a68b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1980_c11_723a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1985_c11_48da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1988_c11_a505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1996_c11_45bb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1974_l1989_l1966_l1981_DUPLICATE_ddd9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1974_l1989_l1966_l1981_DUPLICATE_ddd9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1974_l1989_l1966_l1981_DUPLICATE_ddd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_adba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1988_l1962_l1985_l1980_DUPLICATE_66cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_33f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1996_l1965_l1962_l1985_l1957_l1980_DUPLICATE_1cc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1977_l1973_l1970_l1965_l1988_l1962_l1985_l1957_l1980_DUPLICATE_d66d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1988_c7_32cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1991_c30_fd59_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1996_c7_9408] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1974_c3_0831] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_left;
     BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_return_output := BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1957_c1_bdd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1996_c7_9408] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1989_c3_57ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_left;
     BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output := BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1996_c7_9408] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1974_c3_0831_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1989_c3_57ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1982_l1967_DUPLICATE_68c4_return_output;
     VAR_printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1957_c1_bdd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1996_c7_9408_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1996_c7_9408_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1996_c7_9408_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1985_c7_d650] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     t16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     t16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := t16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1994_c21_421e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_left;
     BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_return_output := BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1985_c7_d650] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;

     -- n16_MUX[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1988_c7_32cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_cond;
     n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue;
     n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output := n16_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;

     -- printf_uxn_opcodes_h_l1958_c3_e719[uxn_opcodes_h_l1958_c3_e719] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1958_c3_e719_uxn_opcodes_h_l1958_c3_e719_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1994_c21_849f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c21_421e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1980_c7_6a78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;

     -- t16_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     t16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     t16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := t16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1985_c7_d650] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;

     -- MUX[uxn_opcodes_h_l1994_c21_849f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1994_c21_849f_cond <= VAR_MUX_uxn_opcodes_h_l1994_c21_849f_cond;
     MUX_uxn_opcodes_h_l1994_c21_849f_iftrue <= VAR_MUX_uxn_opcodes_h_l1994_c21_849f_iftrue;
     MUX_uxn_opcodes_h_l1994_c21_849f_iffalse <= VAR_MUX_uxn_opcodes_h_l1994_c21_849f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1994_c21_849f_return_output := MUX_uxn_opcodes_h_l1994_c21_849f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1980_c7_6a78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1985_c7_d650] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;

     -- n16_MUX[uxn_opcodes_h_l1985_c7_d650] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1985_c7_d650_cond <= VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_cond;
     n16_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue;
     n16_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_return_output := n16_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1985_c7_d650] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue := VAR_MUX_uxn_opcodes_h_l1994_c21_849f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1977_c7_dfb2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1980_c7_6a78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;

     -- t16_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := t16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1980_c7_6a78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1980_c7_6a78] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1988_c7_32cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1980_c7_6a78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1980_c7_6a78_cond <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_cond;
     n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue;
     n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output := n16_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1977_c7_dfb2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1988_c7_32cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_dfb2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     t16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     t16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := t16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1977_c7_dfb2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1977_c7_dfb2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond;
     n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue;
     n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output := n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_dfb2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1985_c7_d650] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_return_output := result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1985_c7_d650_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     -- t16_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     t16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     t16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := t16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1980_c7_6a78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output := result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     n16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     n16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := n16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1980_c7_6a78_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1977_c7_dfb2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     n16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     n16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := n16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1977_c7_dfb2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- n16_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := n16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1973_c7_f289] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_return_output := result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1973_c7_f289_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- n16_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     n16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     n16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := n16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1970_c7_606c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_606c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1965_c7_39eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- n16_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     n16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     n16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := n16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1965_c7_39eb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1962_c7_9135] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_return_output := result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_9135_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1957_c2_f420] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_return_output := result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2002_l1953_DUPLICATE_5369 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2002_l1953_DUPLICATE_5369_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c2_f420_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c2_f420_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2002_l1953_DUPLICATE_5369_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2002_l1953_DUPLICATE_5369_return_output;
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
