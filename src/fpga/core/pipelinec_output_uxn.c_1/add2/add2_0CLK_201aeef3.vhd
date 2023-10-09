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
-- Submodules: 123
entity add2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_201aeef3;
architecture arch of add2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l945_c6_4065]
signal BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l945_c1_205b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l945_c2_4551]
signal t16_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l945_c2_4551]
signal result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l945_c2_4551]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l945_c2_4551]
signal result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l945_c2_4551]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l945_c2_4551]
signal result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l945_c2_4551]
signal result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l945_c2_4551]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l945_c2_4551]
signal tmp16_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l945_c2_4551]
signal n16_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l946_c3_9344[uxn_opcodes_h_l946_c3_9344]
signal printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l951_c11_077e]
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l951_c7_f522]
signal t16_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l951_c7_f522]
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l951_c7_f522]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l951_c7_f522]
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l951_c7_f522]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l951_c7_f522]
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l951_c7_f522]
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l951_c7_f522]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l951_c7_f522]
signal tmp16_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l951_c7_f522]
signal n16_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l954_c11_8cce]
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal t16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l954_c7_7fe1]
signal n16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l959_c11_526e]
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l959_c7_35a1]
signal t16_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l959_c7_35a1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l959_c7_35a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l959_c7_35a1]
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l959_c7_35a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l959_c7_35a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l959_c7_35a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l959_c7_35a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l959_c7_35a1]
signal tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l959_c7_35a1]
signal n16_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_b278]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l962_c7_dd04]
signal t16_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_dd04]
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_dd04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c7_dd04]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_dd04]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_dd04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_dd04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_dd04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l962_c7_dd04]
signal tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c7_dd04]
signal n16_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l963_c3_f4a2]
signal BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l966_c11_eff6]
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l966_c7_19b3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l966_c7_19b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l966_c7_19b3]
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l966_c7_19b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l966_c7_19b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l966_c7_19b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l966_c7_19b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l966_c7_19b3]
signal tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l966_c7_19b3]
signal n16_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_14c6]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l969_c7_55fc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_55fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l969_c7_55fc]
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l969_c7_55fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_55fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_55fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_55fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l969_c7_55fc]
signal tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l969_c7_55fc]
signal n16_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l974_c11_8161]
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l974_c7_f3ab]
signal n16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_2f7f]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_90e2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_90e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l977_c7_90e2]
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_90e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_90e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_90e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_90e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l977_c7_90e2]
signal tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l977_c7_90e2]
signal n16_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l978_c3_986a]
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l979_c11_4040]
signal BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l982_c32_7ab0]
signal BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l982_c32_b801]
signal BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l982_c32_b694]
signal MUX_uxn_opcodes_h_l982_c32_b694_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l982_c32_b694_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l982_c32_b694_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l982_c32_b694_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l984_c11_42b6]
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l984_c7_a95b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l984_c7_a95b]
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_a95b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_a95b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l984_c7_a95b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l990_c11_83a5]
signal BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l990_c7_4476]
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l990_c7_4476]
signal result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l990_c7_4476]
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l990_c7_4476]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l992_c34_d158]
signal CONST_SR_8_uxn_opcodes_h_l992_c34_d158_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l992_c34_d158_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l994_c11_1263]
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l994_c7_4ab9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l994_c7_4ab9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065
BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_left,
BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_right,
BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_return_output);

-- t16_MUX_uxn_opcodes_h_l945_c2_4551
t16_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l945_c2_4551_cond,
t16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
t16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
t16_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551
result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551
result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551
result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_cond,
result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551
result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551
result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551
result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- tmp16_MUX_uxn_opcodes_h_l945_c2_4551
tmp16_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l945_c2_4551_cond,
tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
tmp16_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- n16_MUX_uxn_opcodes_h_l945_c2_4551
n16_MUX_uxn_opcodes_h_l945_c2_4551 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l945_c2_4551_cond,
n16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue,
n16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse,
n16_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

-- printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344
printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344 : entity work.printf_uxn_opcodes_h_l946_c3_9344_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e
BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_left,
BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_right,
BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output);

-- t16_MUX_uxn_opcodes_h_l951_c7_f522
t16_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l951_c7_f522_cond,
t16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
t16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
t16_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522
result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_cond,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- tmp16_MUX_uxn_opcodes_h_l951_c7_f522
tmp16_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l951_c7_f522_cond,
tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
tmp16_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- n16_MUX_uxn_opcodes_h_l951_c7_f522
n16_MUX_uxn_opcodes_h_l951_c7_f522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l951_c7_f522_cond,
n16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue,
n16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse,
n16_MUX_uxn_opcodes_h_l951_c7_f522_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce
BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_left,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_right,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output);

-- t16_MUX_uxn_opcodes_h_l954_c7_7fe1
t16_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
t16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1
result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1
tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- n16_MUX_uxn_opcodes_h_l954_c7_7fe1
n16_MUX_uxn_opcodes_h_l954_c7_7fe1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond,
n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue,
n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse,
n16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e
BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_left,
BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_right,
BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output);

-- t16_MUX_uxn_opcodes_h_l959_c7_35a1
t16_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
t16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
t16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
t16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1
result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l959_c7_35a1
tmp16_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- n16_MUX_uxn_opcodes_h_l959_c7_35a1
n16_MUX_uxn_opcodes_h_l959_c7_35a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l959_c7_35a1_cond,
n16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue,
n16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse,
n16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278
BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output);

-- t16_MUX_uxn_opcodes_h_l962_c7_dd04
t16_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
t16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
t16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
t16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04
result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- tmp16_MUX_uxn_opcodes_h_l962_c7_dd04
tmp16_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c7_dd04
n16_MUX_uxn_opcodes_h_l962_c7_dd04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c7_dd04_cond,
n16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue,
n16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse,
n16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2
BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_left,
BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_right,
BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6
BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_left,
BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_right,
BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3
result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3
result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l966_c7_19b3
tmp16_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- n16_MUX_uxn_opcodes_h_l966_c7_19b3
n16_MUX_uxn_opcodes_h_l966_c7_19b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l966_c7_19b3_cond,
n16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue,
n16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse,
n16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6
BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc
result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc
result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l969_c7_55fc
tmp16_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- n16_MUX_uxn_opcodes_h_l969_c7_55fc
n16_MUX_uxn_opcodes_h_l969_c7_55fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l969_c7_55fc_cond,
n16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue,
n16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse,
n16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161
BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_left,
BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_right,
BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab
result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab
tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- n16_MUX_uxn_opcodes_h_l974_c7_f3ab
n16_MUX_uxn_opcodes_h_l974_c7_f3ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond,
n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue,
n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse,
n16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f
BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2
result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l977_c7_90e2
tmp16_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- n16_MUX_uxn_opcodes_h_l977_c7_90e2
n16_MUX_uxn_opcodes_h_l977_c7_90e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l977_c7_90e2_cond,
n16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue,
n16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse,
n16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l978_c3_986a
BIN_OP_OR_uxn_opcodes_h_l978_c3_986a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_left,
BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_right,
BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040
BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_left,
BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_right,
BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0
BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_left,
BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_right,
BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l982_c32_b801
BIN_OP_GT_uxn_opcodes_h_l982_c32_b801 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_left,
BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_right,
BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_return_output);

-- MUX_uxn_opcodes_h_l982_c32_b694
MUX_uxn_opcodes_h_l982_c32_b694 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l982_c32_b694_cond,
MUX_uxn_opcodes_h_l982_c32_b694_iftrue,
MUX_uxn_opcodes_h_l982_c32_b694_iffalse,
MUX_uxn_opcodes_h_l982_c32_b694_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6
BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_left,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_right,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b
result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_cond,
result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5
BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_left,
BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_right,
BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476
result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476
result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_cond,
result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476
result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_return_output);

-- CONST_SR_8_uxn_opcodes_h_l992_c34_d158
CONST_SR_8_uxn_opcodes_h_l992_c34_d158 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l992_c34_d158_x,
CONST_SR_8_uxn_opcodes_h_l992_c34_d158_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263
BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_left,
BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_right,
BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8
CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_return_output,
 t16_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 tmp16_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 n16_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output,
 t16_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 tmp16_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 n16_MUX_uxn_opcodes_h_l951_c7_f522_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output,
 t16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 n16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output,
 t16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 n16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output,
 t16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 n16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output,
 BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 n16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 n16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 n16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 n16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_return_output,
 BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_return_output,
 MUX_uxn_opcodes_h_l982_c32_b694_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_return_output,
 CONST_SR_8_uxn_opcodes_h_l992_c34_d158_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_c33a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_1a2c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l957_c3_cf14 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_ee08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_09d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l967_c3_d718 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_97a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_aad9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l979_c3_fe02 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l982_c32_b694_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l982_c32_b694_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l982_c32_b694_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l982_c32_b694_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l987_c3_d7ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l988_c24_dc33_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_e3f9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l992_c34_d158_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l992_c34_d158_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l992_c24_3cc4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l955_l978_l970_l963_DUPLICATE_adf6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l990_l977_DUPLICATE_7c3c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l941_l999_DUPLICATE_48d0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l987_c3_d7ba := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l987_c3_d7ba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_97a0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_97a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l982_c32_b694_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_aad9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_aad9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_ee08 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_ee08;
     VAR_MUX_uxn_opcodes_h_l982_c32_b694_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l957_c3_cf14 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l957_c3_cf14;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_e3f9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_e3f9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_1a2c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_1a2c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_c33a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_c33a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l967_c3_d718 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l967_c3_d718;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_09d7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_09d7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l992_c34_d158_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_2f7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l990_l977_DUPLICATE_7c3c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l990_l977_DUPLICATE_7c3c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_14c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l984_c11_42b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l988_c24_dc33] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l988_c24_dc33_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_AND[uxn_opcodes_h_l982_c32_7ab0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_left;
     BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_return_output := BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l959_c11_526e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_left;
     BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output := BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_b278] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l945_c6_4065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_left;
     BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output := BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l954_c11_8cce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_left;
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output := BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l990_c11_83a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l974_c11_8161] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_left;
     BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output := BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l992_c34_d158] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l992_c34_d158_x <= VAR_CONST_SR_8_uxn_opcodes_h_l992_c34_d158_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l992_c34_d158_return_output := CONST_SR_8_uxn_opcodes_h_l992_c34_d158_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l994_c11_1263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_left;
     BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output := BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l966_c11_eff6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_left;
     BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output := BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l955_l978_l970_l963_DUPLICATE_adf6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l955_l978_l970_l963_DUPLICATE_adf6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l951_c11_077e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_left;
     BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output := BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_left := VAR_BIN_OP_AND_uxn_opcodes_h_l982_c32_7ab0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l945_c6_4065_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_077e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_8cce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_526e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_b278_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l966_c11_eff6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_14c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_8161_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_2f7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_42b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l990_c11_83a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_1263_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l955_l978_l970_l963_DUPLICATE_adf6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l955_l978_l970_l963_DUPLICATE_adf6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l955_l978_l970_l963_DUPLICATE_adf6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l988_c24_dc33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_263f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l962_l990_l959_l984_l954_l977_l951_l974_l969_l966_l994_DUPLICATE_cb17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l959_l984_l954_l951_l974_l945_l969_l966_DUPLICATE_ea4d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l959_l954_l977_l951_l974_l969_l966_DUPLICATE_8530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_l994_DUPLICATE_f82e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l990_l977_DUPLICATE_7c3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l990_l977_DUPLICATE_7c3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l990_l959_l954_l977_l951_l974_l945_l969_l966_DUPLICATE_bb2f_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l992_c24_3cc4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l992_c24_3cc4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l992_c34_d158_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l984_c7_a95b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l945_c1_205b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l994_c7_4ab9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l978_c3_986a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_left;
     BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output := BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l990_c7_4476] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l994_c7_4ab9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l982_c32_b801] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_left;
     BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_return_output := BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l963_c3_f4a2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_left;
     BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_return_output := BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l982_c32_b694_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l982_c32_b801_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f4a2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_right := VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_986a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l992_c24_3cc4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l956_l971_DUPLICATE_6cc8_return_output;
     VAR_printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l945_c1_205b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_4ab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l990_c7_4476_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- printf_uxn_opcodes_h_l946_c3_9344[uxn_opcodes_h_l946_c3_9344] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l946_c3_9344_uxn_opcodes_h_l946_c3_9344_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l990_c7_4476] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l984_c7_a95b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l979_c11_4040] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_left;
     BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_return_output := BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_return_output;

     -- t16_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     t16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     t16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := t16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- n16_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     n16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     n16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := n16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l990_c7_4476] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l990_c7_4476] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_cond;
     result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_return_output := result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_return_output;

     -- MUX[uxn_opcodes_h_l982_c32_b694] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l982_c32_b694_cond <= VAR_MUX_uxn_opcodes_h_l982_c32_b694_cond;
     MUX_uxn_opcodes_h_l982_c32_b694_iftrue <= VAR_MUX_uxn_opcodes_h_l982_c32_b694_iftrue;
     MUX_uxn_opcodes_h_l982_c32_b694_iffalse <= VAR_MUX_uxn_opcodes_h_l982_c32_b694_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l982_c32_b694_return_output := MUX_uxn_opcodes_h_l982_c32_b694_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l979_c3_fe02 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l979_c11_4040_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := VAR_MUX_uxn_opcodes_h_l982_c32_b694_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l990_c7_4476_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l990_c7_4476_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l990_c7_4476_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue := VAR_tmp16_uxn_opcodes_h_l979_c3_fe02;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := n16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_a95b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_a95b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;

     -- t16_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     t16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     t16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := t16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l984_c7_a95b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_return_output := result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l984_c7_a95b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     n16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     n16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := n16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_90e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := t16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_90e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_t16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- t16_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     t16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     t16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_return_output := t16_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     n16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     n16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := n16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l974_c7_f3ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_n16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f3ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_t16_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     t16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     t16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_return_output := t16_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_55fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     n16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := n16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_55fc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l945_c2_4551_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l966_c7_19b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- n16_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     n16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     n16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := n16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l966_c7_19b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_dd04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- n16_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := n16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_n16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_dd04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- n16_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     n16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     n16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_return_output := n16_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l959_c7_35a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_n16_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_35a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_return_output := tmp16_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- n16_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     n16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     n16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_return_output := n16_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_7fe1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l945_c2_4551_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_7fe1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_return_output := tmp16_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l951_c7_f522] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_cond;
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_return_output := result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_f522_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l945_c2_4551_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_return_output := result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l945_c2_4551] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l941_l999_DUPLICATE_48d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l941_l999_DUPLICATE_48d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l945_c2_4551_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l945_c2_4551_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l941_l999_DUPLICATE_48d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l941_l999_DUPLICATE_48d0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
