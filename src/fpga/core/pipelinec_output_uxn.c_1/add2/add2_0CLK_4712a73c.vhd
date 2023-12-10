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
-- Submodules: 71
entity add2_0CLK_4712a73c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_4712a73c;
architecture arch of add2_0CLK_4712a73c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l842_c6_87b1]
signal BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l842_c2_c367]
signal n16_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l842_c2_c367]
signal t16_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l842_c2_c367]
signal tmp16_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l842_c2_c367]
signal result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l842_c2_c367]
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l842_c2_c367]
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c2_c367]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c2_c367]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l849_c11_d0ed]
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal n16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal t16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l849_c7_1ec9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l852_c11_08c9]
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l852_c7_b379]
signal n16_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l852_c7_b379]
signal t16_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l852_c7_b379]
signal tmp16_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l852_c7_b379]
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_b379]
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_b379]
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_b379]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_b379]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l857_c11_ddcc]
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l857_c7_c231]
signal n16_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l857_c7_c231]
signal t16_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l857_c7_c231]
signal tmp16_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l857_c7_c231]
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_c231]
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_c231]
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_c231]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_c231]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l858_c3_917b]
signal BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_7edb]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l861_c7_5b24]
signal n16_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l861_c7_5b24]
signal tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l861_c7_5b24]
signal result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_5b24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_5b24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_5b24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_5b24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l865_c11_2f77]
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l865_c7_2c6c]
signal n16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l865_c7_2c6c]
signal tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l865_c7_2c6c]
signal result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_2c6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_2c6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_2c6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_2c6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l866_c3_b542]
signal BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l867_c11_0f5e]
signal BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l869_c30_00df]
signal sp_relative_shift_uxn_opcodes_h_l869_c30_00df_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l869_c30_00df_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l869_c30_00df_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l869_c30_00df_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_3851]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_df2e]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_df2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_df2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_df2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_df2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l877_c31_10cf]
signal CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l879_c11_a42f]
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_0069]
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_0069]
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1
BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_left,
BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_right,
BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output);

-- n16_MUX_uxn_opcodes_h_l842_c2_c367
n16_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l842_c2_c367_cond,
n16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
n16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
n16_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- t16_MUX_uxn_opcodes_h_l842_c2_c367
t16_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l842_c2_c367_cond,
t16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
t16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
t16_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- tmp16_MUX_uxn_opcodes_h_l842_c2_c367
tmp16_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l842_c2_c367_cond,
tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
tmp16_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367
result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_cond,
result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367
result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367
result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed
BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_left,
BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_right,
BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output);

-- n16_MUX_uxn_opcodes_h_l849_c7_1ec9
n16_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
n16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- t16_MUX_uxn_opcodes_h_l849_c7_1ec9
t16_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
t16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9
tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9
result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9
BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_left,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_right,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output);

-- n16_MUX_uxn_opcodes_h_l852_c7_b379
n16_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l852_c7_b379_cond,
n16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
n16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
n16_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- t16_MUX_uxn_opcodes_h_l852_c7_b379
t16_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l852_c7_b379_cond,
t16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
t16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
t16_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- tmp16_MUX_uxn_opcodes_h_l852_c7_b379
tmp16_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l852_c7_b379_cond,
tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
tmp16_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379
result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_cond,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc
BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_left,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_right,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output);

-- n16_MUX_uxn_opcodes_h_l857_c7_c231
n16_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l857_c7_c231_cond,
n16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
n16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
n16_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- t16_MUX_uxn_opcodes_h_l857_c7_c231
t16_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l857_c7_c231_cond,
t16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
t16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
t16_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- tmp16_MUX_uxn_opcodes_h_l857_c7_c231
tmp16_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l857_c7_c231_cond,
tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
tmp16_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231
result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_cond,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l858_c3_917b
BIN_OP_OR_uxn_opcodes_h_l858_c3_917b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_left,
BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_right,
BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output);

-- n16_MUX_uxn_opcodes_h_l861_c7_5b24
n16_MUX_uxn_opcodes_h_l861_c7_5b24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l861_c7_5b24_cond,
n16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue,
n16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse,
n16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output);

-- tmp16_MUX_uxn_opcodes_h_l861_c7_5b24
tmp16_MUX_uxn_opcodes_h_l861_c7_5b24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_cond,
tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue,
tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse,
tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24
result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_cond,
result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_left,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_right,
BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output);

-- n16_MUX_uxn_opcodes_h_l865_c7_2c6c
n16_MUX_uxn_opcodes_h_l865_c7_2c6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond,
n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue,
n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse,
n16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c
tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond,
tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c
result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l866_c3_b542
BIN_OP_OR_uxn_opcodes_h_l866_c3_b542 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_left,
BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_right,
BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e
BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_left,
BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_right,
BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l869_c30_00df
sp_relative_shift_uxn_opcodes_h_l869_c30_00df : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l869_c30_00df_ins,
sp_relative_shift_uxn_opcodes_h_l869_c30_00df_x,
sp_relative_shift_uxn_opcodes_h_l869_c30_00df_y,
sp_relative_shift_uxn_opcodes_h_l869_c30_00df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851
BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e
result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l877_c31_10cf
CONST_SR_8_uxn_opcodes_h_l877_c31_10cf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_x,
CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f
BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_left,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_right,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b
CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output,
 n16_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 t16_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 tmp16_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output,
 n16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 t16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output,
 n16_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 t16_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 tmp16_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output,
 n16_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 t16_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 tmp16_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_return_output,
 BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output,
 n16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output,
 tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output,
 n16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_return_output,
 sp_relative_shift_uxn_opcodes_h_l869_c30_00df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_return_output,
 CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_cb67 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_f88a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_6a3b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_f1d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l867_c3_64fc : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_de24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l872_c21_b455_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_7d6f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_ab18 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l877_c21_f7d3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l853_l862_l858_l866_DUPLICATE_e4c9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_bc93_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l884_l838_DUPLICATE_fe5f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_f88a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_f88a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_ab18 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_ab18;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_7d6f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_7d6f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_de24 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_de24;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_f1d2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_f1d2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_6a3b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_6a3b;
     VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_cb67 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_cb67;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l842_c6_87b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l857_c11_ddcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l879_c11_a42f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_left;
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output := BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l853_l862_l858_l866_DUPLICATE_e4c9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l853_l862_l858_l866_DUPLICATE_e4c9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l869_c30_00df] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l869_c30_00df_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_ins;
     sp_relative_shift_uxn_opcodes_h_l869_c30_00df_x <= VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_x;
     sp_relative_shift_uxn_opcodes_h_l869_c30_00df_y <= VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_return_output := sp_relative_shift_uxn_opcodes_h_l869_c30_00df_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l877_c31_10cf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_return_output := CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l865_c11_2f77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_left;
     BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output := BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_bc93 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_bc93_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l849_c11_d0ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_3851] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_7edb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l852_c11_08c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c6_87b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_d0ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_08c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_ddcc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7edb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l865_c11_2f77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_3851_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_a42f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l853_l862_l858_l866_DUPLICATE_e4c9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l853_l862_l858_l866_DUPLICATE_e4c9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l853_l862_l858_l866_DUPLICATE_e4c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_8e73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l865_DUPLICATE_530e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l879_l842_DUPLICATE_2522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_bc93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l861_l874_DUPLICATE_bc93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l857_l874_l849_l852_l861_l842_DUPLICATE_1515_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l869_c30_00df_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l877_c21_f7d3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l877_c21_f7d3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l877_c31_10cf_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l858_c3_917b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_left;
     BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_return_output := BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l866_c3_b542] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_left;
     BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output := BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_df2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_df2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_0069] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_0069] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_917b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l866_c3_b542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l877_c21_f7d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l854_l863_DUPLICATE_4f3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0069_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;
     -- t16_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     t16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     t16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_return_output := t16_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l865_c7_2c6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_df2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l867_c11_0f5e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_df2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l865_c7_2c6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;

     -- n16_MUX[uxn_opcodes_h_l865_c7_2c6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond;
     n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue;
     n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output := n16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_df2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l867_c3_64fc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l867_c11_0f5e_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse := VAR_n16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_df2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_t16_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue := VAR_tmp16_uxn_opcodes_h_l867_c3_64fc;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_5b24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;

     -- t16_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     t16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     t16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_return_output := t16_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l865_c7_2c6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l865_c7_2c6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_cond;
     tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output := tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l872_c21_b455] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l872_c21_b455_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l867_c3_64fc);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_5b24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;

     -- n16_MUX[uxn_opcodes_h_l861_c7_5b24] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l861_c7_5b24_cond <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_cond;
     n16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue;
     n16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output := n16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l865_c7_2c6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l872_c21_b455_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := VAR_n16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;
     -- n16_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     n16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     n16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_return_output := n16_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l861_c7_5b24] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_cond;
     tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue;
     tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output := tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;

     -- t16_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := t16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_5b24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_5b24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l865_c7_2c6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_n16_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l865_c7_2c6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_t16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l861_c7_5b24] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_cond;
     result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_return_output := result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- n16_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     n16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     n16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_return_output := n16_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- t16_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     t16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     t16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_return_output := t16_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_return_output := tmp16_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l861_c7_5b24_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l842_c2_c367_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l857_c7_c231] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_cond;
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_return_output := result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_return_output := tmp16_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- n16_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := n16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_n16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_c231_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- n16_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     n16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     n16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_return_output := n16_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l852_c7_b379] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_cond;
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_return_output := result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l842_c2_c367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_b379_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_return_output := tmp16_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l849_c7_1ec9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output := result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_1ec9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l842_c2_c367_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l842_c2_c367] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_cond;
     result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_return_output := result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l884_l838_DUPLICATE_fe5f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l884_l838_DUPLICATE_fe5f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l842_c2_c367_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l842_c2_c367_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l884_l838_DUPLICATE_fe5f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l884_l838_DUPLICATE_fe5f_return_output;
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
