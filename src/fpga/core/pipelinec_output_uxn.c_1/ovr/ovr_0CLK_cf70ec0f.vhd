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
-- Submodules: 73
entity ovr_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_cf70ec0f;
architecture arch of ovr_0CLK_cf70ec0f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l330_c6_f0eb]
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_191d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l330_c2_670b]
signal n8_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l330_c2_670b]
signal t8_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l330_c2_670b]
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_670b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_670b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_670b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_670b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_670b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_670b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l331_c3_71a4[uxn_opcodes_h_l331_c3_71a4]
signal printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_ad8a]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l336_c7_7537]
signal n8_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l336_c7_7537]
signal t8_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l336_c7_7537]
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_7537]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_7537]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_7537]
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_7537]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_7537]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_7537]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l339_c11_c556]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal n8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal t8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_fcaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l343_c11_942a]
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal n8_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_8b1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l346_c11_540b]
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l346_c7_af79]
signal n8_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l346_c7_af79]
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c7_af79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c7_af79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l346_c7_af79]
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c7_af79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l346_c7_af79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l346_c7_af79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l350_c32_a6d4]
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l350_c32_85e3]
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l350_c32_5783]
signal MUX_uxn_opcodes_h_l350_c32_5783_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_5783_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_5783_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_5783_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_f687]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l352_c7_6b56]
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_6b56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c7_6b56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_6b56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_6b56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l358_c11_3489]
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l358_c7_f636]
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_f636]
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_f636]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_f636]
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_f4c5]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l362_c7_ab89]
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_ab89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_ab89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_ab89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_85c4]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_8431]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_8431]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb
BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_left,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_right,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_return_output);

-- n8_MUX_uxn_opcodes_h_l330_c2_670b
n8_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l330_c2_670b_cond,
n8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
n8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
n8_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- t8_MUX_uxn_opcodes_h_l330_c2_670b
t8_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l330_c2_670b_cond,
t8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
t8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
t8_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b
result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_cond,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

-- printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4
printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4 : entity work.printf_uxn_opcodes_h_l331_c3_71a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a
BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output);

-- n8_MUX_uxn_opcodes_h_l336_c7_7537
n8_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l336_c7_7537_cond,
n8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
n8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
n8_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- t8_MUX_uxn_opcodes_h_l336_c7_7537
t8_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l336_c7_7537_cond,
t8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
t8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
t8_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537
result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_cond,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556
BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output);

-- n8_MUX_uxn_opcodes_h_l339_c7_fcaa
n8_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
n8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- t8_MUX_uxn_opcodes_h_l339_c7_fcaa
t8_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
t8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a
BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_left,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_right,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output);

-- n8_MUX_uxn_opcodes_h_l343_c7_8b1e
n8_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
n8_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e
result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b
BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_left,
BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_right,
BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output);

-- n8_MUX_uxn_opcodes_h_l346_c7_af79
n8_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l346_c7_af79_cond,
n8_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
n8_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
n8_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79
result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_cond,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4
BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_left,
BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_right,
BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3
BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_left,
BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_right,
BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_return_output);

-- MUX_uxn_opcodes_h_l350_c32_5783
MUX_uxn_opcodes_h_l350_c32_5783 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l350_c32_5783_cond,
MUX_uxn_opcodes_h_l350_c32_5783_iftrue,
MUX_uxn_opcodes_h_l350_c32_5783_iffalse,
MUX_uxn_opcodes_h_l350_c32_5783_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687
BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56
result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_cond,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489
BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_left,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_right,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636
result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_cond,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5
BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89
result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_cond,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4
BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_return_output,
 n8_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 t8_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output,
 n8_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 t8_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output,
 n8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 t8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output,
 n8_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output,
 n8_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_return_output,
 BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_return_output,
 MUX_uxn_opcodes_h_l350_c32_5783_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e6e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_5358 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_bbea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_209e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_5783_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_5783_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_5783_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_5783_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_b7fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_168c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_84f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l336_l343_l346_l339_DUPLICATE_72a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l346_DUPLICATE_cc03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l371_l326_DUPLICATE_46cd_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_168c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_168c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_bbea := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_bbea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_b7fa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_b7fa;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e6e2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e6e2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l350_c32_5783_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l350_c32_5783_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_84f1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_84f1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_209e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_209e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_5358 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_5358;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l350_c32_a6d4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_left;
     BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_return_output := BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l358_c11_3489] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_left;
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output := BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l343_c11_942a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_left;
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output := BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l346_DUPLICATE_cc03 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l346_DUPLICATE_cc03_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c11_c556] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l346_c11_540b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_left;
     BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output := BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_85c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l336_l343_l346_l339_DUPLICATE_72a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l336_l343_l346_l339_DUPLICATE_72a6_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_f4c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l330_c6_f0eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_ad8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_f687] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_a6d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_f0eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_ad8a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_c556_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_942a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_540b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_f687_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_3489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_f4c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_85c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l330_l336_l346_l343_l339_DUPLICATE_5b75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_4f88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l330_l352_l336_l343_l339_DUPLICATE_6d63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l336_l343_l346_l339_DUPLICATE_72a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l336_l343_l346_l339_DUPLICATE_72a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l336_l343_l346_l339_DUPLICATE_72a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l336_l343_l346_l339_DUPLICATE_72a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_l358_l366_DUPLICATE_cd42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l346_DUPLICATE_cc03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l362_l346_DUPLICATE_cc03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l330_l362_l336_l346_l343_l339_DUPLICATE_3742_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l350_c32_85e3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_left;
     BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_return_output := BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_return_output;

     -- t8_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := t8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_8431] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_191d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_ab89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c7_6b56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l362_c7_ab89] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_cond;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_return_output := result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;

     -- n8_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     n8_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     n8_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_return_output := n8_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_8431] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l350_c32_5783_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_85e3_return_output;
     VAR_printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_191d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_8431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_8431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_t8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_f636] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_return_output;

     -- printf_uxn_opcodes_h_l331_c3_71a4[uxn_opcodes_h_l331_c3_71a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l331_c3_71a4_uxn_opcodes_h_l331_c3_71a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- t8_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     t8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     t8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_return_output := t8_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l358_c7_f636] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_cond;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_return_output := result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_ab89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;

     -- n8_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := n8_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- MUX[uxn_opcodes_h_l350_c32_5783] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l350_c32_5783_cond <= VAR_MUX_uxn_opcodes_h_l350_c32_5783_cond;
     MUX_uxn_opcodes_h_l350_c32_5783_iftrue <= VAR_MUX_uxn_opcodes_h_l350_c32_5783_iftrue;
     MUX_uxn_opcodes_h_l350_c32_5783_iffalse <= VAR_MUX_uxn_opcodes_h_l350_c32_5783_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l350_c32_5783_return_output := MUX_uxn_opcodes_h_l350_c32_5783_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_ab89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue := VAR_MUX_uxn_opcodes_h_l350_c32_5783_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_n8_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_ab89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_f636_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_f636_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_6b56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_f636] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_return_output;

     -- t8_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     t8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     t8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_return_output := t8_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l352_c7_6b56] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_cond;
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_return_output := result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;

     -- n8_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := n8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_f636] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_n8_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_f636_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_f636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l330_c2_670b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_return_output := result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_6b56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;

     -- n8_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     n8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     n8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_return_output := n8_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_6b56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6b56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l346_c7_af79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_return_output;

     -- n8_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     n8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     n8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_return_output := n8_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l330_c2_670b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_af79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_8b1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_8b1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_return_output := result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_fcaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_fcaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_return_output := result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_7537] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_7537_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_670b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l371_l326_DUPLICATE_46cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l371_l326_DUPLICATE_46cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_670b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_670b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l371_l326_DUPLICATE_46cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l371_l326_DUPLICATE_46cd_return_output;
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
