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
entity gth2_0CLK_0226dad5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_0226dad5;
architecture arch of gth2_0CLK_0226dad5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1818_c6_a332]
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1818_c2_2892]
signal n16_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1818_c2_2892]
signal t16_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1818_c2_2892]
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1818_c2_2892]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c2_2892]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c2_2892]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c2_2892]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_981c]
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1825_c7_7b00]
signal n16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1825_c7_7b00]
signal t16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1825_c7_7b00]
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1825_c7_7b00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_7b00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_7b00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_7b00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1828_c11_dcbb]
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1828_c7_f47f]
signal n16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1828_c7_f47f]
signal t16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1828_c7_f47f]
signal result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1828_c7_f47f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1828_c7_f47f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1828_c7_f47f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1828_c7_f47f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1833_c11_5c1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1833_c7_700c]
signal n16_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1833_c7_700c]
signal t16_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1833_c7_700c]
signal result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c7_700c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c7_700c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c7_700c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1833_c7_700c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1834_c3_76c6]
signal BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_faf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1837_c7_ef71]
signal n16_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_ef71]
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_ef71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_ef71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_ef71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_ef71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_13db]
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1841_c7_121c]
signal n16_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1841_c7_121c]
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_121c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_121c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1841_c7_121c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1841_c7_121c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1842_c3_30aa]
signal BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1844_c30_827c]
signal sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1847_c21_e8dc]
signal BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1847_c21_dbc6]
signal MUX_uxn_opcodes_h_l1847_c21_dbc6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1847_c21_dbc6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1847_c21_dbc6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1847_c21_dbc6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_cdf8]
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_0693]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_0693]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_0693]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_return_output : signed(3 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332
BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_left,
BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_right,
BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output);

-- n16_MUX_uxn_opcodes_h_l1818_c2_2892
n16_MUX_uxn_opcodes_h_l1818_c2_2892 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1818_c2_2892_cond,
n16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue,
n16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse,
n16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

-- t16_MUX_uxn_opcodes_h_l1818_c2_2892
t16_MUX_uxn_opcodes_h_l1818_c2_2892 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1818_c2_2892_cond,
t16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue,
t16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse,
t16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892
result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_cond,
result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_left,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_right,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output);

-- n16_MUX_uxn_opcodes_h_l1825_c7_7b00
n16_MUX_uxn_opcodes_h_l1825_c7_7b00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond,
n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue,
n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse,
n16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output);

-- t16_MUX_uxn_opcodes_h_l1825_c7_7b00
t16_MUX_uxn_opcodes_h_l1825_c7_7b00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond,
t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue,
t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse,
t16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_cond,
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_left,
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_right,
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output);

-- n16_MUX_uxn_opcodes_h_l1828_c7_f47f
n16_MUX_uxn_opcodes_h_l1828_c7_f47f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond,
n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue,
n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse,
n16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output);

-- t16_MUX_uxn_opcodes_h_l1828_c7_f47f
t16_MUX_uxn_opcodes_h_l1828_c7_f47f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond,
t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue,
t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse,
t16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f
result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f
result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output);

-- n16_MUX_uxn_opcodes_h_l1833_c7_700c
n16_MUX_uxn_opcodes_h_l1833_c7_700c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1833_c7_700c_cond,
n16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue,
n16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse,
n16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output);

-- t16_MUX_uxn_opcodes_h_l1833_c7_700c
t16_MUX_uxn_opcodes_h_l1833_c7_700c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1833_c7_700c_cond,
t16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue,
t16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse,
t16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c
result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6
BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_left,
BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_right,
BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output);

-- n16_MUX_uxn_opcodes_h_l1837_c7_ef71
n16_MUX_uxn_opcodes_h_l1837_c7_ef71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1837_c7_ef71_cond,
n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue,
n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse,
n16_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_cond,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_left,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_right,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output);

-- n16_MUX_uxn_opcodes_h_l1841_c7_121c
n16_MUX_uxn_opcodes_h_l1841_c7_121c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1841_c7_121c_cond,
n16_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue,
n16_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse,
n16_MUX_uxn_opcodes_h_l1841_c7_121c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa
BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_left,
BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_right,
BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1844_c30_827c
sp_relative_shift_uxn_opcodes_h_l1844_c30_827c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_ins,
sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_x,
sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_y,
sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc
BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_left,
BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_right,
BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_return_output);

-- MUX_uxn_opcodes_h_l1847_c21_dbc6
MUX_uxn_opcodes_h_l1847_c21_dbc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1847_c21_dbc6_cond,
MUX_uxn_opcodes_h_l1847_c21_dbc6_iftrue,
MUX_uxn_opcodes_h_l1847_c21_dbc6_iffalse,
MUX_uxn_opcodes_h_l1847_c21_dbc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_left,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_right,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output,
 n16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
 t16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output,
 n16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output,
 t16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output,
 n16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output,
 t16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output,
 n16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output,
 t16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output,
 n16_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output,
 n16_MUX_uxn_opcodes_h_l1841_c7_121c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output,
 sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_return_output,
 MUX_uxn_opcodes_h_l1847_c21_dbc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_e4fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_f7a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1831_c3_ae64 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_39bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_a9ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_9e07 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1838_l1842_l1829_DUPLICATE_db91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_l1841_DUPLICATE_d057_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1855_l1814_DUPLICATE_40df_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_39bc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1835_c3_39bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_f7a9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_f7a9;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_9e07 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1850_c3_9e07;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_e4fd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_e4fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_a9ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_a9ad;
     VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1831_c3_ae64 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1831_c3_ae64;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1844_c30_827c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_ins;
     sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_x;
     sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_return_output := sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1828_c11_dcbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_13db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1818_c6_a332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_left;
     BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output := BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1833_c11_5c1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_faf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_cdf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1838_l1842_l1829_DUPLICATE_db91 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1838_l1842_l1829_DUPLICATE_db91_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_l1841_DUPLICATE_d057 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_l1841_DUPLICATE_d057_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_981c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c6_a332_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_981c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_dcbb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_5c1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_faf9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_13db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_cdf8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1838_l1842_l1829_DUPLICATE_db91_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1838_l1842_l1829_DUPLICATE_db91_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1838_l1842_l1829_DUPLICATE_db91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_164c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1849_l1841_DUPLICATE_14a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1849_DUPLICATE_1d8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_l1841_DUPLICATE_d057_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1837_l1841_DUPLICATE_d057_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1837_l1833_l1828_l1825_l1818_l1841_DUPLICATE_6d1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1844_c30_827c_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1842_c3_30aa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_left;
     BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output := BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_0693] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_0693] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_0693] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1834_c3_76c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_left;
     BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_return_output := BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1841_c7_121c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1834_c3_76c6_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_30aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1830_l1839_DUPLICATE_690c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_0693_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_0693_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_0693_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;
     -- t16_MUX[uxn_opcodes_h_l1833_c7_700c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1833_c7_700c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_cond;
     t16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue;
     t16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output := t16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_121c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_121c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_ef71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1847_c21_e8dc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_left;
     BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_return_output := BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1841_c7_121c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1841_c7_121c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_cond;
     n16_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue;
     n16_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_return_output := n16_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1841_c7_121c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1847_c21_e8dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_ef71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_ef71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_ef71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c7_700c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;

     -- MUX[uxn_opcodes_h_l1847_c21_dbc6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1847_c21_dbc6_cond <= VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_cond;
     MUX_uxn_opcodes_h_l1847_c21_dbc6_iftrue <= VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_iftrue;
     MUX_uxn_opcodes_h_l1847_c21_dbc6_iffalse <= VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_return_output := MUX_uxn_opcodes_h_l1847_c21_dbc6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1828_c7_f47f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond;
     t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue;
     t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output := t16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1837_c7_ef71] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1837_c7_ef71_cond <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_cond;
     n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue;
     n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output := n16_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue := VAR_MUX_uxn_opcodes_h_l1847_c21_dbc6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1841_c7_121c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c7_700c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1828_c7_f47f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c7_700c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1833_c7_700c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1833_c7_700c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_cond;
     n16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue;
     n16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output := n16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1825_c7_7b00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond;
     t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue;
     t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output := t16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1833_c7_700c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1841_c7_121c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1828_c7_f47f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_ef71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output := result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1828_c7_f47f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1828_c7_f47f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1828_c7_f47f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_cond;
     n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue;
     n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output := n16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1818_c2_2892] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1818_c2_2892_cond <= VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_cond;
     t16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue;
     t16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output := t16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_7b00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_ef71_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1825_c7_7b00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1833_c7_700c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1825_c7_7b00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_cond;
     n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue;
     n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output := n16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c2_2892] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_7b00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_7b00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1833_c7_700c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1818_c2_2892] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;

     -- n16_MUX[uxn_opcodes_h_l1818_c2_2892] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1818_c2_2892_cond <= VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_cond;
     n16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue;
     n16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output := n16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c2_2892] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1828_c7_f47f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c2_2892] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1828_c7_f47f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1825_c7_7b00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output := result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1825_c7_7b00_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1818_c2_2892] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_return_output := result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1855_l1814_DUPLICATE_40df LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1855_l1814_DUPLICATE_40df_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c2_2892_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c2_2892_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1855_l1814_DUPLICATE_40df_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1855_l1814_DUPLICATE_40df_return_output;
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
