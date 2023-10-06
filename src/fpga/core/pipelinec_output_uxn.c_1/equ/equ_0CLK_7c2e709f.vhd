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
-- Submodules: 65
entity equ_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_7c2e709f;
architecture arch of equ_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1335_c6_20cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1335_c1_2022]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1335_c2_b616]
signal t8_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1335_c2_b616]
signal n8_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c2_b616]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1335_c2_b616]
signal result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c2_b616]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c2_b616]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c2_b616]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c2_b616]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1335_c2_b616]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1336_c3_0012[uxn_opcodes_h_l1336_c3_0012]
signal printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1341_c11_4087]
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1341_c7_2372]
signal t8_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1341_c7_2372]
signal n8_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c7_2372]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1341_c7_2372]
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c7_2372]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c7_2372]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c7_2372]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c7_2372]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1341_c7_2372]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1344_c11_8fe2]
signal BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1344_c7_ed6b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_8198]
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1348_c7_918b]
signal n8_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_918b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1348_c7_918b]
signal result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_918b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1348_c7_918b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_918b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_918b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1348_c7_918b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_60f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1351_c7_4734]
signal n8_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1351_c7_4734]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1351_c7_4734]
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_4734]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1351_c7_4734]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_4734]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_4734]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1351_c7_4734]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1355_c32_2bfe]
signal BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1355_c32_956d]
signal BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1355_c32_95c4]
signal MUX_uxn_opcodes_h_l1355_c32_95c4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1355_c32_95c4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1355_c32_95c4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1355_c32_95c4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_696b]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1357_c7_ba42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1357_c7_ba42]
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_ba42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_ba42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_ba42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1361_c24_de80]
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1361_c24_ecc4]
signal MUX_uxn_opcodes_h_l1361_c24_ecc4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1361_c24_ecc4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1361_c24_ecc4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1361_c24_ecc4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_e95a]
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_244c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_244c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc
BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_return_output);

-- t8_MUX_uxn_opcodes_h_l1335_c2_b616
t8_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
t8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
t8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
t8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- n8_MUX_uxn_opcodes_h_l1335_c2_b616
n8_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
n8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
n8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
n8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616
result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616
result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

-- printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012
printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012 : entity work.printf_uxn_opcodes_h_l1336_c3_0012_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_left,
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_right,
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output);

-- t8_MUX_uxn_opcodes_h_l1341_c7_2372
t8_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
t8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
t8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
t8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- n8_MUX_uxn_opcodes_h_l1341_c7_2372
n8_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
n8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
n8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
n8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372
result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2
BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_left,
BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_right,
BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output);

-- t8_MUX_uxn_opcodes_h_l1344_c7_ed6b
t8_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- n8_MUX_uxn_opcodes_h_l1344_c7_ed6b
n8_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b
result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_left,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_right,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output);

-- n8_MUX_uxn_opcodes_h_l1348_c7_918b
n8_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
n8_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
n8_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
n8_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b
result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b
result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output);

-- n8_MUX_uxn_opcodes_h_l1351_c7_4734
n8_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
n8_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
n8_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
n8_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe
BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_left,
BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_right,
BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d
BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_left,
BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_right,
BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_return_output);

-- MUX_uxn_opcodes_h_l1355_c32_95c4
MUX_uxn_opcodes_h_l1355_c32_95c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1355_c32_95c4_cond,
MUX_uxn_opcodes_h_l1355_c32_95c4_iftrue,
MUX_uxn_opcodes_h_l1355_c32_95c4_iffalse,
MUX_uxn_opcodes_h_l1355_c32_95c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_cond,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80
BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_left,
BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_right,
BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_return_output);

-- MUX_uxn_opcodes_h_l1361_c24_ecc4
MUX_uxn_opcodes_h_l1361_c24_ecc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1361_c24_ecc4_cond,
MUX_uxn_opcodes_h_l1361_c24_ecc4_iftrue,
MUX_uxn_opcodes_h_l1361_c24_ecc4_iffalse,
MUX_uxn_opcodes_h_l1361_c24_ecc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_left,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_right,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_return_output,
 t8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 n8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output,
 t8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 n8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output,
 t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output,
 n8_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output,
 n8_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_return_output,
 MUX_uxn_opcodes_h_l1355_c32_95c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_return_output,
 MUX_uxn_opcodes_h_l1361_c24_ecc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1338_c3_6120 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1342_c3_6841 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_5e00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1349_c3_32d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1360_c3_2947 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1341_l1348_l1344_l1351_DUPLICATE_cec6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_l1351_DUPLICATE_7ea9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1331_l1368_DUPLICATE_3abf_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1349_c3_32d8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1349_c3_32d8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1342_c3_6841 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1342_c3_6841;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_5e00 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_5e00;
     VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1338_c3_6120 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1338_c3_6120;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1360_c3_2947 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1360_c3_2947;
     VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l1355_c32_2bfe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_left;
     BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_return_output := BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_e95a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_696b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_8198] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_left;
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output := BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1344_c11_8fe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1361_c24_de80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_left;
     BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_return_output := BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_60f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c6_20cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1341_c11_4087] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_left;
     BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output := BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1341_l1348_l1344_l1351_DUPLICATE_cec6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1341_l1348_l1344_l1351_DUPLICATE_cec6_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_l1351_DUPLICATE_7ea9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_l1351_DUPLICATE_7ea9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1355_c32_2bfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c6_20cc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_4087_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1344_c11_8fe2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_8198_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_60f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_696b_return_output;
     VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c24_de80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_e95a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1351_l1348_DUPLICATE_555a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1357_l1351_l1348_DUPLICATE_77a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1348_DUPLICATE_82eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1341_l1348_l1344_l1351_DUPLICATE_cec6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1341_l1348_l1344_l1351_DUPLICATE_cec6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1341_l1348_l1344_l1351_DUPLICATE_cec6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1341_l1348_l1344_l1351_DUPLICATE_cec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1344_l1341_l1363_l1335_l1351_l1348_DUPLICATE_7370_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_l1351_DUPLICATE_7ea9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1357_l1351_DUPLICATE_7ea9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1344_l1341_l1335_l1357_l1351_l1348_DUPLICATE_4308_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1335_c1_2022] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_return_output;

     -- n8_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     n8_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     n8_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := n8_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- MUX[uxn_opcodes_h_l1361_c24_ecc4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1361_c24_ecc4_cond <= VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_cond;
     MUX_uxn_opcodes_h_l1361_c24_ecc4_iftrue <= VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_iftrue;
     MUX_uxn_opcodes_h_l1361_c24_ecc4_iffalse <= VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_return_output := MUX_uxn_opcodes_h_l1361_c24_ecc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1357_c7_ba42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;

     -- t8_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_ba42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_244c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_244c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1355_c32_956d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_left;
     BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_return_output := BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1355_c32_956d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue := VAR_MUX_uxn_opcodes_h_l1361_c24_ecc4_return_output;
     VAR_printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1335_c1_2022_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_244c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_244c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- printf_uxn_opcodes_h_l1336_c3_0012[uxn_opcodes_h_l1336_c3_0012] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1336_c3_0012_uxn_opcodes_h_l1336_c3_0012_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_ba42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_ba42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;

     -- MUX[uxn_opcodes_h_l1355_c32_95c4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1355_c32_95c4_cond <= VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_cond;
     MUX_uxn_opcodes_h_l1355_c32_95c4_iftrue <= VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_iftrue;
     MUX_uxn_opcodes_h_l1355_c32_95c4_iffalse <= VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_return_output := MUX_uxn_opcodes_h_l1355_c32_95c4_return_output;

     -- n8_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     n8_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     n8_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := n8_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     t8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     t8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := t8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1357_c7_ba42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output := result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue := VAR_MUX_uxn_opcodes_h_l1355_c32_95c4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_ba42_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1351_c7_4734] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_return_output := result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;

     -- t8_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     t8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     t8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := t8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_4734_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1348_c7_918b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     n8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     n8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := n8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1348_c7_918b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     n8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     n8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := n8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1344_c7_ed6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1344_c7_ed6b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1341_c7_2372] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_return_output := result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_2372_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c2_b616] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1331_l1368_DUPLICATE_3abf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1331_l1368_DUPLICATE_3abf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c2_b616_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1335_c2_b616_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1331_l1368_DUPLICATE_3abf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1331_l1368_DUPLICATE_3abf_return_output;
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
