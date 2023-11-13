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
-- Submodules: 66
entity gth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_302e9520;
architecture arch of gth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_1701]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_8404]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_7457]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_7457]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_7457]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_7457]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_7457]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_7457]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c2_7457]
signal t16_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c2_7457]
signal n16_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1759_c3_6b37[uxn_opcodes_h_l1759_c3_6b37]
signal printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_4eaa]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_4bc3]
signal n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_c0ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal t16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1766_c7_cd81]
signal n16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_ec57]
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_7494]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_7494]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_7494]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_7494]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_7494]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_7494]
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1771_c7_7494]
signal t16_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1771_c7_7494]
signal n16_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1772_c3_507e]
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_51a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_544f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_544f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_544f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_544f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_544f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_544f]
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1775_c7_544f]
signal n16_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_66c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_3bb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_3bb5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_3bb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_3bb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_3bb5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_3bb5]
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1779_c7_3bb5]
signal n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1780_c3_f8bf]
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_6685]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1785_c21_17e7]
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1785_c21_f25f]
signal MUX_uxn_opcodes_h_l1785_c21_f25f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_f25f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_f25f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_f25f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_7cab]
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_e742]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_e742]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_e742]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c2_7457
t16_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
t16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c2_7457
n16_MUX_uxn_opcodes_h_l1758_c2_7457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c2_7457_cond,
n16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

-- printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37
printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37 : entity work.printf_uxn_opcodes_h_l1759_c3_6b37_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- t16_MUX_uxn_opcodes_h_l1763_c7_4bc3
t16_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_4bc3
n16_MUX_uxn_opcodes_h_l1763_c7_4bc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- t16_MUX_uxn_opcodes_h_l1766_c7_cd81
t16_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
t16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- n16_MUX_uxn_opcodes_h_l1766_c7_cd81
n16_MUX_uxn_opcodes_h_l1766_c7_cd81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond,
n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue,
n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse,
n16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_left,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_right,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- t16_MUX_uxn_opcodes_h_l1771_c7_7494
t16_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
t16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
t16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
t16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- n16_MUX_uxn_opcodes_h_l1771_c7_7494
n16_MUX_uxn_opcodes_h_l1771_c7_7494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1771_c7_7494_cond,
n16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue,
n16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse,
n16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e
BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_left,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_right,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_return_output);

-- n16_MUX_uxn_opcodes_h_l1775_c7_544f
n16_MUX_uxn_opcodes_h_l1775_c7_544f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1775_c7_544f_cond,
n16_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue,
n16_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse,
n16_MUX_uxn_opcodes_h_l1775_c7_544f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output);

-- n16_MUX_uxn_opcodes_h_l1779_c7_3bb5
n16_MUX_uxn_opcodes_h_l1779_c7_3bb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond,
n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue,
n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse,
n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf
BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_left,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_right,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_6685
sp_relative_shift_uxn_opcodes_h_l1782_c30_6685 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7
BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_left,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_right,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_return_output);

-- MUX_uxn_opcodes_h_l1785_c21_f25f
MUX_uxn_opcodes_h_l1785_c21_f25f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1785_c21_f25f_cond,
MUX_uxn_opcodes_h_l1785_c21_f25f_iftrue,
MUX_uxn_opcodes_h_l1785_c21_f25f_iffalse,
MUX_uxn_opcodes_h_l1785_c21_f25f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_left,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_right,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 t16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 n16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 t16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 n16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_return_output,
 n16_MUX_uxn_opcodes_h_l1775_c7_544f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output,
 n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_return_output,
 MUX_uxn_opcodes_h_l1785_c21_f25f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_9983 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_b47d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_4104 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_40a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_682d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1780_l1767_l1776_DUPLICATE_1b16_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_f618_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1793_l1754_DUPLICATE_8bd0_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_b47d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_b47d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_682d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_682d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_4104 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_4104;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_9983 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_9983;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_40a9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_40a9;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_c0ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_f618 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_f618_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_7cab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1780_l1767_l1776_DUPLICATE_1b16 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1780_l1767_l1776_DUPLICATE_1b16_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_6685] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_66c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_1701] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_ec57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_left;
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output := BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_4eaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_51a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_1701_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_4eaa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_c0ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_ec57_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_51a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_66c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_7cab_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1780_l1767_l1776_DUPLICATE_1b16_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1780_l1767_l1776_DUPLICATE_1b16_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1772_l1780_l1767_l1776_DUPLICATE_1b16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_d89d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c69a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_1382_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_0658_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_f618_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_f618_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_3454_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6685_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_3bb5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_e742] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_3bb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_e742] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1772_c3_507e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_left;
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_return_output := BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_8404] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1780_c3_f8bf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_left;
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output := BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_e742] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_507e_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_f8bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3941_return_output;
     VAR_printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_8404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_e742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_e742_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_e742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;
     -- t16_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     t16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     t16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := t16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_3bb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1779_c7_3bb5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond;
     n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue;
     n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output := n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;

     -- printf_uxn_opcodes_h_l1759_c3_6b37[uxn_opcodes_h_l1759_c3_6b37] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1759_c3_6b37_uxn_opcodes_h_l1759_c3_6b37_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_544f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_3bb5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_544f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1785_c21_17e7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_left;
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_return_output := BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_3bb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_17e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_544f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_544f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_544f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;

     -- MUX[uxn_opcodes_h_l1785_c21_f25f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1785_c21_f25f_cond <= VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_cond;
     MUX_uxn_opcodes_h_l1785_c21_f25f_iftrue <= VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_iftrue;
     MUX_uxn_opcodes_h_l1785_c21_f25f_iffalse <= VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_return_output := MUX_uxn_opcodes_h_l1785_c21_f25f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := t16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- n16_MUX[uxn_opcodes_h_l1775_c7_544f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1775_c7_544f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_cond;
     n16_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue;
     n16_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_return_output := n16_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue := VAR_MUX_uxn_opcodes_h_l1785_c21_f25f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- n16_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     n16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     n16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := n16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_3bb5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- t16_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3bb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     -- n16_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := n16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     t16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := t16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_544f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_544f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;
     -- n16_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_7494] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_return_output := result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_7494_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_cd81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output := result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     n16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := n16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cd81_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_4bc3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4bc3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_7457] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1793_l1754_DUPLICATE_8bd0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1793_l1754_DUPLICATE_8bd0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_7457_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_7457_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1793_l1754_DUPLICATE_8bd0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1793_l1754_DUPLICATE_8bd0_return_output;
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
