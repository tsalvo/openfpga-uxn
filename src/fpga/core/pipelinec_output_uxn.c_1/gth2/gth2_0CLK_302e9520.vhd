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
-- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_d17e]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_56f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal n16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal t16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_35e6]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1759_c3_dc47[uxn_opcodes_h_l1759_c3_dc47]
signal printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_8ef3]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_4837]
signal n16_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1763_c7_4837]
signal t16_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_4837]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_4837]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_4837]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_4837]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_4837]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_4837]
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_1605]
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_cf3c]
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_6823]
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal n16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal t16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_ab27]
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1772_c3_bdfa]
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_43f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1775_c7_672e]
signal n16_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_672e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_672e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_672e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_672e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_672e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_672e]
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_298b]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1779_c7_0f2d]
signal n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_0f2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_0f2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_0f2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_0f2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_0f2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_0f2d]
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1780_c3_3790]
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_5a22]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1785_c21_12df]
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1785_c21_f03c]
signal MUX_uxn_opcodes_h_l1785_c21_f03c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_f03c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_f03c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1785_c21_f03c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_37ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_1a8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_1a8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_1a8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c2_35e6
n16_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c2_35e6
t16_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

-- printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47
printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47 : entity work.printf_uxn_opcodes_h_l1759_c3_dc47_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_4837
n16_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- t16_MUX_uxn_opcodes_h_l1763_c7_4837
t16_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
t16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
t16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
t16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_cond,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_left,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_right,
BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output);

-- n16_MUX_uxn_opcodes_h_l1766_c7_cf3c
n16_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- t16_MUX_uxn_opcodes_h_l1766_c7_cf3c
t16_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_left,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_right,
BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output);

-- n16_MUX_uxn_opcodes_h_l1771_c7_ab27
n16_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
n16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- t16_MUX_uxn_opcodes_h_l1771_c7_ab27
t16_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
t16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_cond,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa
BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_left,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_right,
BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output);

-- n16_MUX_uxn_opcodes_h_l1775_c7_672e
n16_MUX_uxn_opcodes_h_l1775_c7_672e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1775_c7_672e_cond,
n16_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue,
n16_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse,
n16_MUX_uxn_opcodes_h_l1775_c7_672e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output);

-- n16_MUX_uxn_opcodes_h_l1779_c7_0f2d
n16_MUX_uxn_opcodes_h_l1779_c7_0f2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond,
n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue,
n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse,
n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790
BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_left,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_right,
BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22
sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df
BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_left,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_right,
BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_return_output);

-- MUX_uxn_opcodes_h_l1785_c21_f03c
MUX_uxn_opcodes_h_l1785_c21_f03c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1785_c21_f03c_cond,
MUX_uxn_opcodes_h_l1785_c21_f03c_iftrue,
MUX_uxn_opcodes_h_l1785_c21_f03c_iffalse,
MUX_uxn_opcodes_h_l1785_c21_f03c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 t16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output,
 n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output,
 n16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 t16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output,
 n16_MUX_uxn_opcodes_h_l1775_c7_672e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output,
 n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_return_output,
 MUX_uxn_opcodes_h_l1785_c21_f03c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_d76c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_d610 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_bcd5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_4d28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_0003 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_f85e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_aa90_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1793_l1754_DUPLICATE_a8be_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_d610 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_d610;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_0003 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_0003;
     VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_bcd5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_bcd5;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_d76c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_d76c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_4d28 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1773_c3_4d28;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1766_c11_1605] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_left;
     BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output := BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1787_c11_37ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_aa90 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_aa90_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_298b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_5a22] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_8ef3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1771_c11_6823] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_left;
     BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output := BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1775_c11_43f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_f85e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_f85e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c6_d17e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c6_d17e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_8ef3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1766_c11_1605_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1771_c11_6823_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1775_c11_43f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_298b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1787_c11_37ab_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_f85e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_f85e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1767_l1776_l1772_l1780_DUPLICATE_f85e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_b6bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1787_l1779_l1775_l1771_l1766_l1763_DUPLICATE_c52c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_60a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1787_l1775_l1771_l1766_l1763_DUPLICATE_a550_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_aa90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1775_l1779_DUPLICATE_aa90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1779_l1775_l1771_l1766_l1763_DUPLICATE_e55e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_5a22_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1787_c7_1a8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1772_c3_bdfa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_left;
     BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_return_output := BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1780_c3_3790] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_left;
     BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output := BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1787_c7_1a8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_0f2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_0f2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1758_c1_56f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1787_c7_1a8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1772_c3_bdfa_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1780_c3_3790_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1777_l1768_DUPLICATE_3814_return_output;
     VAR_printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1758_c1_56f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1787_c7_1a8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_0f2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1785_c21_12df] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_left;
     BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_return_output := BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1775_c7_672e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1775_c7_672e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_0f2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := t16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- printf_uxn_opcodes_h_l1759_c3_dc47[uxn_opcodes_h_l1759_c3_dc47] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1759_c3_dc47_uxn_opcodes_h_l1759_c3_dc47_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_0f2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1779_c7_0f2d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond;
     n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue;
     n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output := n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1785_c21_12df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     -- t16_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1775_c7_672e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1775_c7_672e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_cond;
     n16_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue;
     n16_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_return_output := n16_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1775_c7_672e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1775_c7_672e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- MUX[uxn_opcodes_h_l1785_c21_f03c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1785_c21_f03c_cond <= VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_cond;
     MUX_uxn_opcodes_h_l1785_c21_f03c_iftrue <= VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_iftrue;
     MUX_uxn_opcodes_h_l1785_c21_f03c_iffalse <= VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_return_output := MUX_uxn_opcodes_h_l1785_c21_f03c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1775_c7_672e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue := VAR_MUX_uxn_opcodes_h_l1785_c21_f03c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     -- t16_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     t16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     t16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := t16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- n16_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := n16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_0f2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_0f2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := t16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- n16_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1775_c7_672e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1775_c7_672e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1771_c7_ab27] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output := result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;

     -- n16_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1771_c7_ab27_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1766_c7_cf3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := n16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1766_c7_cf3c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_4837] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_return_output := result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_4837_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c2_35e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1793_l1754_DUPLICATE_a8be LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1793_l1754_DUPLICATE_a8be_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c2_35e6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1793_l1754_DUPLICATE_a8be_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1793_l1754_DUPLICATE_a8be_return_output;
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
