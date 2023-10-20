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
-- Submodules: 105
entity add2_0CLK_e3a03e27 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_e3a03e27;
architecture arch of add2_0CLK_e3a03e27 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l893_c6_0efc]
signal BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l893_c2_e94f]
signal tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l893_c2_e94f]
signal n16_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l893_c2_e94f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l893_c2_e94f]
signal result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l893_c2_e94f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l893_c2_e94f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l893_c2_e94f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l893_c2_e94f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l893_c2_e94f]
signal t16_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l898_c11_3954]
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal n16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l898_c7_5fa7]
signal t16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l901_c11_2bbb]
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l901_c7_8c46]
signal tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l901_c7_8c46]
signal n16_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_8c46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l901_c7_8c46]
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_8c46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_8c46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_8c46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l901_c7_8c46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l901_c7_8c46]
signal t16_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l906_c11_821c]
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal n16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l906_c7_f2ff]
signal t16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l909_c11_c4de]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal n16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l909_c7_3ca1]
signal t16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l910_c3_07cb]
signal BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_7f87]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l913_c7_65e5]
signal tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l913_c7_65e5]
signal n16_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_65e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l913_c7_65e5]
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_65e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_65e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_65e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_65e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l916_c11_b12a]
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal n16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_e6f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_a05b]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l921_c7_0bce]
signal tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l921_c7_0bce]
signal n16_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_0bce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l921_c7_0bce]
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_0bce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_0bce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_0bce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_0bce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l924_c11_cda8]
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l924_c7_252d]
signal tmp16_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l924_c7_252d]
signal n16_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_252d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l924_c7_252d]
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_252d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_252d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_252d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l924_c7_252d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l925_c3_11d9]
signal BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l926_c11_6a81]
signal BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l928_c30_e32f]
signal sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l933_c11_b36a]
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l933_c7_7c85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l933_c7_7c85]
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l933_c7_7c85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l933_c7_7c85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l933_c7_7c85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l936_c31_f70d]
signal CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l938_c11_f8f7]
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_a2f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_a2f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc
BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_left,
BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_right,
BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l893_c2_e94f
tmp16_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- n16_MUX_uxn_opcodes_h_l893_c2_e94f
n16_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
n16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
n16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
n16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f
result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- t16_MUX_uxn_opcodes_h_l893_c2_e94f
t16_MUX_uxn_opcodes_h_l893_c2_e94f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l893_c2_e94f_cond,
t16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue,
t16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse,
t16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954
BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_left,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_right,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output);

-- tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7
tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- n16_MUX_uxn_opcodes_h_l898_c7_5fa7
n16_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
n16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7
result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- t16_MUX_uxn_opcodes_h_l898_c7_5fa7
t16_MUX_uxn_opcodes_h_l898_c7_5fa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond,
t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue,
t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse,
t16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb
BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_left,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_right,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l901_c7_8c46
tmp16_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- n16_MUX_uxn_opcodes_h_l901_c7_8c46
n16_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
n16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
n16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
n16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46
result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- t16_MUX_uxn_opcodes_h_l901_c7_8c46
t16_MUX_uxn_opcodes_h_l901_c7_8c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l901_c7_8c46_cond,
t16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue,
t16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse,
t16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c
BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_left,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_right,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff
tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- n16_MUX_uxn_opcodes_h_l906_c7_f2ff
n16_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
n16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff
result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- t16_MUX_uxn_opcodes_h_l906_c7_f2ff
t16_MUX_uxn_opcodes_h_l906_c7_f2ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond,
t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue,
t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse,
t16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de
BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1
tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- n16_MUX_uxn_opcodes_h_l909_c7_3ca1
n16_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
n16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1
result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- t16_MUX_uxn_opcodes_h_l909_c7_3ca1
t16_MUX_uxn_opcodes_h_l909_c7_3ca1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond,
t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue,
t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse,
t16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb
BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_left,
BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_right,
BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87
BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output);

-- tmp16_MUX_uxn_opcodes_h_l913_c7_65e5
tmp16_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- n16_MUX_uxn_opcodes_h_l913_c7_65e5
n16_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
n16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
n16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
n16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5
result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a
BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_left,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_right,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4
tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- n16_MUX_uxn_opcodes_h_l916_c7_e6f4
n16_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
n16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4
result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l921_c7_0bce
tmp16_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- n16_MUX_uxn_opcodes_h_l921_c7_0bce
n16_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
n16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
n16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
n16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce
result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8
BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_left,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_right,
BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l924_c7_252d
tmp16_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l924_c7_252d_cond,
tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
tmp16_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- n16_MUX_uxn_opcodes_h_l924_c7_252d
n16_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l924_c7_252d_cond,
n16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
n16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
n16_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d
result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_cond,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d
result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9
BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_left,
BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_right,
BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81
BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_left,
BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_right,
BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_return_output);

-- sp_relative_shift_uxn_opcodes_h_l928_c30_e32f
sp_relative_shift_uxn_opcodes_h_l928_c30_e32f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_ins,
sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_x,
sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_y,
sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a
BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_left,
BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_right,
BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85
result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_cond,
result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_return_output);

-- CONST_SR_8_uxn_opcodes_h_l936_c31_f70d
CONST_SR_8_uxn_opcodes_h_l936_c31_f70d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_x,
CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7
BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_left,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_right,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f
CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output,
 tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 n16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 t16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output,
 tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 n16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 t16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output,
 tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 n16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 t16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output,
 tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 n16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 t16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output,
 tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 n16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 t16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output,
 tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 n16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output,
 tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 n16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output,
 tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 n16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output,
 tmp16_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 n16_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_return_output,
 sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_return_output,
 CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_2d3a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_ab84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_fcbd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_529a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_2d3e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_92bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_d8a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l922_c3_4be7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l926_c3_5103 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l930_c3_cb7e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l931_c21_a1b9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_6eb8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_c7_7c85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l936_c21_ffff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l917_l902_l925_DUPLICATE_704b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l943_l889_DUPLICATE_45a3_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_ab84 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_ab84;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l930_c3_cb7e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l930_c3_cb7e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_529a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_529a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_6eb8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_6eb8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_92bf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_92bf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_fcbd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_fcbd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_2d3a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_2d3a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l922_c3_4be7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l922_c3_4be7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_2d3e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_2d3e;
     VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_d8a7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_d8a7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_right := to_unsigned(7, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l917_l902_l925_DUPLICATE_704b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l917_l902_l925_DUPLICATE_704b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l916_c11_b12a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_left;
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output := BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l938_c11_f8f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_a05b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l898_c11_3954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_left;
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output := BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l893_c6_0efc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_left;
     BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output := BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l906_c11_821c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_left;
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output := BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l936_c31_f70d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_return_output := CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l933_c7_7c85] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_c7_7c85_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l924_c11_cda8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_left;
     BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output := BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l933_c11_b36a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_left;
     BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output := BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c11_c4de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l928_c30_e32f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_ins;
     sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_x;
     sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_return_output := sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l901_c11_2bbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_7f87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_0efc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_3954_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_2bbb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_821c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_c4de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_7f87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_b12a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a05b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l924_c11_cda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_b36a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_f8f7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l917_l902_l925_DUPLICATE_704b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l917_l902_l925_DUPLICATE_704b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l917_l902_l925_DUPLICATE_704b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l924_l898_l921_l893_l916_l913_l909_l906_l901_DUPLICATE_237d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l924_l898_l921_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_9b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_af3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l938_l906_l933_l901_DUPLICATE_7e62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l898_l921_l893_l916_l913_l909_l906_l933_l901_DUPLICATE_4f31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l933_c7_7c85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l928_c30_e32f_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l925_c3_11d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_left;
     BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output := BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l910_c3_07cb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_left;
     BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_return_output := BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l936_c21_ffff] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l936_c21_ffff_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l936_c31_f70d_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l933_c7_7c85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_a2f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l933_c7_7c85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_a2f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l910_c3_07cb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_right := VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l925_c3_11d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l936_c21_ffff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l903_l918_DUPLICATE_f51f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_a2f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l926_c11_6a81] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_left;
     BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_return_output := BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_return_output;

     -- t16_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := t16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l933_c7_7c85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_return_output := result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l933_c7_7c85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;

     -- n16_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     n16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     n16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_return_output := n16_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l933_c7_7c85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l926_c3_5103 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l926_c11_6a81_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l933_c7_7c85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := VAR_tmp16_uxn_opcodes_h_l926_c3_5103;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l931_c21_a1b9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l931_c21_a1b9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l926_c3_5103);

     -- tmp16_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_return_output := tmp16_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- t16_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := t16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     n16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     n16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := n16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l931_c21_a1b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_t16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     -- t16_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     t16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     t16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := t16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- n16_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := n16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l924_c7_252d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_return_output := result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l924_c7_252d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     -- n16_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     n16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     n16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := n16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- t16_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := t16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l921_c7_0bce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_return_output := result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l921_c7_0bce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := n16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- t16_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     t16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     t16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := t16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l916_c7_e6f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l916_c7_e6f4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l913_c7_65e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := n16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l913_c7_65e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     n16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     n16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := n16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l909_c7_3ca1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output := result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_3ca1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l906_c7_f2ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := n16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_f2ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     -- n16_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     n16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     n16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := n16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l901_c7_8c46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_return_output := result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_8c46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l898_c7_5fa7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output := result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_5fa7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l893_c2_e94f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_return_output := result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l943_l889_DUPLICATE_45a3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l943_l889_DUPLICATE_45a3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_e94f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l943_l889_DUPLICATE_45a3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l943_l889_DUPLICATE_45a3_return_output;
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
