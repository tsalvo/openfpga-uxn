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
-- Submodules: 87
entity sft2_0CLK_e68f2acf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_e68f2acf;
architecture arch of sft2_0CLK_e68f2acf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2390_c6_cdb3]
signal BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2390_c2_c486]
signal tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2390_c2_c486]
signal n16_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2390_c2_c486]
signal t8_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2390_c2_c486]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2390_c2_c486]
signal result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2390_c2_c486]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2390_c2_c486]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2390_c2_c486]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2390_c2_c486]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_abc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_3bdc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2398_c11_ab6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2398_c7_a147]
signal tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2398_c7_a147]
signal n16_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2398_c7_a147]
signal t8_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2398_c7_a147]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2398_c7_a147]
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2398_c7_a147]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2398_c7_a147]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2398_c7_a147]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2398_c7_a147]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_fed3]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2402_c7_e199]
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2402_c7_e199]
signal n16_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_e199]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_e199]
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_e199]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_e199]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_e199]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_e199]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2405_c11_50a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2405_c7_cb1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2407_c3_2dd2]
signal CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2410_c11_6761]
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2410_c7_7ea4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_b16c]
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal n16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2413_c7_0da4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2414_c3_bf89]
signal BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2416_c30_76b9]
signal sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2417_c20_305d]
signal BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2417_c12_3ec2]
signal BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2417_c36_7d90]
signal CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2417_c12_d12c]
signal BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2422_c11_44aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2422_c7_71cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2422_c7_71cd]
signal result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2422_c7_71cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2422_c7_71cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2422_c7_71cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2425_c31_575d]
signal CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2427_c11_1668]
signal BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2427_c7_0fe2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2427_c7_0fe2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3
BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_left,
BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_right,
BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2390_c2_c486
tmp16_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- n16_MUX_uxn_opcodes_h_l2390_c2_c486
n16_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
n16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
n16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
n16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- t8_MUX_uxn_opcodes_h_l2390_c2_c486
t8_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
t8_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
t8_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
t8_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486
result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486
result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486
result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486
result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486
result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc
tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- n16_MUX_uxn_opcodes_h_l2395_c7_3bdc
n16_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- t8_MUX_uxn_opcodes_h_l2395_c7_3bdc
t8_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2398_c7_a147
tmp16_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- n16_MUX_uxn_opcodes_h_l2398_c7_a147
n16_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
n16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
n16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
n16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- t8_MUX_uxn_opcodes_h_l2398_c7_a147
t8_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
t8_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
t8_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
t8_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147
result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2402_c7_e199
tmp16_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- n16_MUX_uxn_opcodes_h_l2402_c7_e199
n16_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
n16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
n16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
n16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b
tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- n16_MUX_uxn_opcodes_h_l2405_c7_cb1b
n16_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b
result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2
CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_x,
CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_left,
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_right,
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4
tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- n16_MUX_uxn_opcodes_h_l2410_c7_7ea4
n16_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_left,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_right,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4
tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- n16_MUX_uxn_opcodes_h_l2413_c7_0da4
n16_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
n16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4
result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89
BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_left,
BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_right,
BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9
sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_ins,
sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_x,
sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_y,
sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d
BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_left,
BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_right,
BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2
BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_left,
BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_right,
BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90
CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_x,
CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c
BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_left,
BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_right,
BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd
result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd
result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd
result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2425_c31_575d
CONST_SR_8_uxn_opcodes_h_l2425_c31_575d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_x,
CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_left,
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_right,
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 n16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 t8_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 n16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 t8_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 n16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output,
 CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output,
 tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 n16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output,
 sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_return_output,
 CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output,
 CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_cf1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_3267 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_19ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_d89b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_d570 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2411_c3_4159 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2419_c3_ab78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2420_c21_3ef3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2424_c3_d036 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2422_c7_71cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2425_c21_b714_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2414_l2406_DUPLICATE_65ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2385_l2432_DUPLICATE_bc29_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_d570 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_d570;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2424_c3_d036 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2424_c3_d036;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2419_c3_ab78 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2419_c3_ab78;
     VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_3267 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_3267;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_cf1e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_cf1e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_19ab := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_19ab;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_d89b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_d89b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2411_c3_4159 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2411_c3_4159;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output := result.is_sp_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2417_c36_7d90] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_return_output := CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2398_c11_ab6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2414_l2406_DUPLICATE_65ef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2414_l2406_DUPLICATE_65ef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_b16c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2427_c11_1668] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_left;
     BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output := BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2390_c6_cdb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_abc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_fed3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2422_c7_71cd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2422_c7_71cd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2422_c11_44aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2405_c11_50a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2425_c31_575d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_return_output := CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output := result.u8_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2417_c20_305d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_left;
     BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_return_output := BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2416_c30_76b9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_ins;
     sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_x;
     sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_return_output := sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2410_c11_6761] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_left;
     BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output := BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2417_c20_305d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2390_c6_cdb3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_abc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_ab6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_fed3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_50a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_6761_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_b16c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_44aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_1668_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2414_l2406_DUPLICATE_65ef_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2414_l2406_DUPLICATE_65ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2398_l2395_l2390_l2413_l2410_l2405_l2402_DUPLICATE_2721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2413_l2410_l2405_l2402_DUPLICATE_0353_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_9406_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2398_l2427_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_d24a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2398_l2395_l2422_l2390_l2410_l2405_l2402_DUPLICATE_62e9_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_right := VAR_CONST_SR_4_uxn_opcodes_h_l2417_c36_7d90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2422_c7_71cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2416_c30_76b9_return_output;
     -- t8_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     t8_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     t8_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := t8_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2427_c7_0fe2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2427_c7_0fe2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2414_c3_bf89] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_left;
     BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output := BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2407_c3_2dd2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_return_output := CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2425_c21_b714] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2425_c21_b714_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2425_c31_575d_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2422_c7_71cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2422_c7_71cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2414_c3_bf89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2425_c21_b714_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2407_c3_2dd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_0fe2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := n16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2422_c7_71cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;

     -- t8_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2417_c12_3ec2] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_left;
     BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_return_output := BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2422_c7_71cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2422_c7_71cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2417_c12_3ec2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2422_c7_71cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     t8_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     t8_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := t8_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- n16_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2417_c12_d12c] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_left;
     BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output := BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2420_c21_3ef3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2420_c21_3ef3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2417_c12_d12c_return_output);

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2420_c21_3ef3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2413_c7_0da4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     n16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     n16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := n16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2413_c7_0da4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2410_c7_7ea4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     n16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     n16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := n16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_7ea4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2405_c7_cb1b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2405_c7_cb1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- n16_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     n16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     n16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := n16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_e199] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_return_output := result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_e199_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2398_c7_a147] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_return_output := result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2398_c7_a147_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2395_c7_3bdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;

     -- Submodule level 11
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_3bdc_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2390_c2_c486] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_return_output := result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2385_l2432_DUPLICATE_bc29 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2385_l2432_DUPLICATE_bc29_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2390_c2_c486_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2385_l2432_DUPLICATE_bc29_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2385_l2432_DUPLICATE_bc29_return_output;
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
