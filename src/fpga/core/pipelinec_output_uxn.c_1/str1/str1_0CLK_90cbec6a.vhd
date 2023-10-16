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
-- Submodules: 57
entity str1_0CLK_90cbec6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_90cbec6a;
architecture arch of str1_0CLK_90cbec6a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1774_c6_c81d]
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1774_c1_bf20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1774_c2_f261]
signal n8_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c2_f261]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1774_c2_f261]
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c2_f261]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1774_c2_f261]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c2_f261]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1774_c2_f261]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1774_c2_f261]
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1774_c2_f261]
signal t8_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1775_c3_8188[uxn_opcodes_h_l1775_c3_8188]
signal printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_d5a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal n8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1779_c7_3e21]
signal t8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_159d]
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal n8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1782_c7_37dd]
signal t8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_1739]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_1b2e]
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_1611]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1789_c7_53d3]
signal n8_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_53d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1789_c7_53d3]
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_53d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_53d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1789_c7_53d3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_53d3]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1792_c30_c062]
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1794_c22_fac4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_3375]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1797_c7_fe95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1797_c7_fe95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_fe95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_left,
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_right,
BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_return_output);

-- n8_MUX_uxn_opcodes_h_l1774_c2_f261
n8_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
n8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
n8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
n8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- t8_MUX_uxn_opcodes_h_l1774_c2_f261
t8_MUX_uxn_opcodes_h_l1774_c2_f261 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1774_c2_f261_cond,
t8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue,
t8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse,
t8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

-- printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188
printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188 : entity work.printf_uxn_opcodes_h_l1775_c3_8188_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output);

-- n8_MUX_uxn_opcodes_h_l1779_c7_3e21
n8_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
n8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- t8_MUX_uxn_opcodes_h_l1779_c7_3e21
t8_MUX_uxn_opcodes_h_l1779_c7_3e21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond,
t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue,
t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse,
t8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_left,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_right,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output);

-- n8_MUX_uxn_opcodes_h_l1782_c7_37dd
n8_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
n8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- t8_MUX_uxn_opcodes_h_l1782_c7_37dd
t8_MUX_uxn_opcodes_h_l1782_c7_37dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond,
t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue,
t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse,
t8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output);

-- n8_MUX_uxn_opcodes_h_l1786_c7_1b2e
n8_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output);

-- n8_MUX_uxn_opcodes_h_l1789_c7_53d3
n8_MUX_uxn_opcodes_h_l1789_c7_53d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1789_c7_53d3_cond,
n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue,
n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse,
n8_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1792_c30_c062
sp_relative_shift_uxn_opcodes_h_l1792_c30_c062 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_ins,
sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_x,
sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_y,
sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_return_output,
 n8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 t8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output,
 n8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 t8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output,
 n8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 t8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output,
 n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output,
 n8_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_0411 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_2460 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_5ba7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_b79b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1786_c7_1b2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1794_c3_3954 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1794_c27_ca7b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1804_l1770_DUPLICATE_c990_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_5ba7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1784_c3_5ba7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_0411 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1776_c3_0411;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_b79b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_b79b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_2460 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1780_c3_2460;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1792_c30_c062] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_ins;
     sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_x;
     sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_return_output := sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_3375] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_159d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_1611] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1786_c7_1b2e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1774_c6_c81d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1794_c27_ca7b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1794_c27_ca7b_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_d5a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_1739] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c6_c81d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_d5a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_159d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_1739_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_1611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_3375_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1794_c27_ca7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_32f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_e261_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1797_l1789_l1786_l1782_l1779_DUPLICATE_1d07_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_8c11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1797_l1786_l1782_l1779_l1774_DUPLICATE_f5a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1789_l1786_l1782_l1779_l1774_DUPLICATE_2bd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1792_c30_c062_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_53d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1774_c1_bf20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_return_output;

     -- t8_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := t8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1789_c7_53d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1789_c7_53d3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1789_c7_53d3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_cond;
     n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue;
     n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output := n8_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1794_c22_fac4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1797_c7_fe95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1797_c7_fe95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_fe95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1794_c3_3954 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1794_c22_fac4_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1774_c1_bf20_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1797_c7_fe95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1794_c3_3954;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1789_c7_53d3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1789_c7_53d3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- printf_uxn_opcodes_h_l1775_c3_8188[uxn_opcodes_h_l1775_c3_8188] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1775_c3_8188_uxn_opcodes_h_l1775_c3_8188_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := t8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_53d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_53d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1789_c7_53d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1786_c7_1b2e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := n8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     t8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     t8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := t8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_1b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- n8_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := n8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1782_c7_37dd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1782_c7_37dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_3e21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;

     -- n8_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     n8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     n8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := n8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1779_c7_3e21_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1774_c2_f261] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1804_l1770_DUPLICATE_c990 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1804_l1770_DUPLICATE_c990_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1774_c2_f261_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c2_f261_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1804_l1770_DUPLICATE_c990_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1804_l1770_DUPLICATE_c990_return_output;
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
