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
-- Submodules: 77
entity inc2_0CLK_26f67814 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_26f67814;
architecture arch of inc2_0CLK_26f67814 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1522_c6_35b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1522_c1_e5f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal t16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1522_c2_25b9]
signal tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1523_c3_fc99[uxn_opcodes_h_l1523_c3_fc99]
signal printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1528_c11_ad00]
signal BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1528_c7_f396]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1528_c7_f396]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1528_c7_f396]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1528_c7_f396]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1528_c7_f396]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1528_c7_f396]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1528_c7_f396]
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1528_c7_f396]
signal t16_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1528_c7_f396]
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1531_c11_6865]
signal BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1531_c7_1ef1]
signal tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1533_c3_619c]
signal CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1536_c11_35e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1536_c7_c177]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1536_c7_c177]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1536_c7_c177]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1536_c7_c177]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1536_c7_c177]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1536_c7_c177]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1536_c7_c177]
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1536_c7_c177]
signal t16_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1536_c7_c177]
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_e389]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1539_c7_6244]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1539_c7_6244]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_6244]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_6244]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_6244]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_6244]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_6244]
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1539_c7_6244]
signal t16_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1539_c7_6244]
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1540_c3_4831]
signal BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1541_c11_1d12]
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1544_c32_9c75]
signal BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1544_c32_30d5]
signal BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1544_c32_a6d3]
signal MUX_uxn_opcodes_h_l1544_c32_a6d3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1544_c32_a6d3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1544_c32_a6d3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1544_c32_a6d3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1546_c11_8484]
signal BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1546_c7_4a5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1546_c7_4a5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1546_c7_4a5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1546_c7_4a5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1546_c7_4a5b]
signal result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1552_c11_0684]
signal BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1552_c7_75fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1552_c7_75fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1552_c7_75fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1552_c7_75fc]
signal result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1554_c34_9fcb]
signal CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1556_c11_866a]
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c7_e05e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c7_e05e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9
result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- t16_MUX_uxn_opcodes_h_l1522_c2_25b9
t16_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
t16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9
tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond,
tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

-- printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99
printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99 : entity work.printf_uxn_opcodes_h_l1523_c3_fc99_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_left,
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_right,
BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396
result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396
result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396
result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- t16_MUX_uxn_opcodes_h_l1528_c7_f396
t16_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
t16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
t16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
t16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1528_c7_f396
tmp16_MUX_uxn_opcodes_h_l1528_c7_f396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_cond,
tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue,
tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse,
tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_left,
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_right,
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1
result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- t16_MUX_uxn_opcodes_h_l1531_c7_1ef1
t16_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1
tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond,
tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1533_c3_619c
CONST_SL_8_uxn_opcodes_h_l1533_c3_619c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_x,
CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177
result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177
result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- t16_MUX_uxn_opcodes_h_l1536_c7_c177
t16_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
t16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
t16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
t16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1536_c7_c177
tmp16_MUX_uxn_opcodes_h_l1536_c7_c177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_cond,
tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue,
tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse,
tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- t16_MUX_uxn_opcodes_h_l1539_c7_6244
t16_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
t16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
t16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
t16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1539_c7_6244
tmp16_MUX_uxn_opcodes_h_l1539_c7_6244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_cond,
tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue,
tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse,
tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831
BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_left,
BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_right,
BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12
BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_left,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_right,
BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75
BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_left,
BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_right,
BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5
BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_left,
BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_right,
BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_return_output);

-- MUX_uxn_opcodes_h_l1544_c32_a6d3
MUX_uxn_opcodes_h_l1544_c32_a6d3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1544_c32_a6d3_cond,
MUX_uxn_opcodes_h_l1544_c32_a6d3_iftrue,
MUX_uxn_opcodes_h_l1544_c32_a6d3_iffalse,
MUX_uxn_opcodes_h_l1544_c32_a6d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484
BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_left,
BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_right,
BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b
result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b
result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b
result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b
result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684
BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_left,
BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_right,
BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc
result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb
CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_x,
CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_left,
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_right,
BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 t16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 t16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output,
 CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 t16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 t16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_return_output,
 MUX_uxn_opcodes_h_l1544_c32_a6d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output,
 CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1525_c3_36b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1529_c3_4ef7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1534_c3_d185 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_efff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1541_c3_602f : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1549_c3_e39d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1550_c24_5936_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1553_c3_ab76 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1554_c24_2698_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1539_l1531_l1536_l1528_DUPLICATE_b059_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1540_l1532_DUPLICATE_9657_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_l1552_DUPLICATE_623d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1561_l1518_DUPLICATE_a738_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1534_c3_d185 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1534_c3_d185;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1553_c3_ab76 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1553_c3_ab76;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_efff := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_efff;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1525_c3_36b7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1525_c3_36b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1529_c3_4ef7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1529_c3_4ef7;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1549_c3_e39d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1549_c3_e39d;
     VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l1544_c32_9c75] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_left;
     BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_return_output := BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1556_c11_866a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1540_l1532_DUPLICATE_9657 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1540_l1532_DUPLICATE_9657_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1550_c24_5936] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1550_c24_5936_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1522_c6_35b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1531_c11_6865] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_left;
     BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output := BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1552_c11_0684] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_left;
     BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output := BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_l1552_DUPLICATE_623d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_l1552_DUPLICATE_623d_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1554_c34_9fcb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_return_output := CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_e389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1528_c11_ad00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_left;
     BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output := BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1539_l1531_l1536_l1528_DUPLICATE_b059 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1539_l1531_l1536_l1528_DUPLICATE_b059_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1546_c11_8484] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_left;
     BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output := BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1536_c11_35e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1544_c32_9c75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c6_35b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1528_c11_ad00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_6865_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_35e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_e389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1546_c11_8484_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1552_c11_0684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c11_866a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1540_l1532_DUPLICATE_9657_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1540_l1532_DUPLICATE_9657_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1550_c24_5936_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_DUPLICATE_1060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1546_l1539_l1536_l1531_l1528_l1556_l1552_DUPLICATE_4cef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1546_l1536_l1531_l1528_l1522_DUPLICATE_34fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1539_l1531_l1536_l1528_DUPLICATE_b059_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1539_l1531_l1536_l1528_DUPLICATE_b059_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1539_l1531_l1536_l1528_DUPLICATE_b059_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1539_l1531_l1536_l1528_DUPLICATE_b059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1556_l1522_l1552_DUPLICATE_ca3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_l1552_DUPLICATE_623d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_l1552_DUPLICATE_623d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1539_l1536_l1531_l1528_l1522_l1552_DUPLICATE_bd33_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1554_c24_2698] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1554_c24_2698_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1554_c34_9fcb_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1522_c1_e5f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1533_c3_619c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_return_output := CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1546_c7_4a5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c7_e05e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1544_c32_30d5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_left;
     BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_return_output := BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1552_c7_75fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1540_c3_4831] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_left;
     BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output := BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c7_e05e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1544_c32_30d5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1540_c3_4831_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1554_c24_2698_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1533_c3_619c_return_output;
     VAR_printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1522_c1_e5f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c7_e05e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;
     -- MUX[uxn_opcodes_h_l1544_c32_a6d3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1544_c32_a6d3_cond <= VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_cond;
     MUX_uxn_opcodes_h_l1544_c32_a6d3_iftrue <= VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_iftrue;
     MUX_uxn_opcodes_h_l1544_c32_a6d3_iffalse <= VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_return_output := MUX_uxn_opcodes_h_l1544_c32_a6d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- printf_uxn_opcodes_h_l1523_c3_fc99[uxn_opcodes_h_l1523_c3_fc99] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1523_c3_fc99_uxn_opcodes_h_l1523_c3_fc99_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     t16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     t16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := t16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1552_c7_75fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1546_c7_4a5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1552_c7_75fc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1552_c7_75fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1541_c11_1d12] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1541_c3_602f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1541_c11_1d12_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := VAR_MUX_uxn_opcodes_h_l1544_c32_a6d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1552_c7_75fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue := VAR_tmp16_uxn_opcodes_h_l1541_c3_602f;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- t16_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     t16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     t16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := t16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1546_c7_4a5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1546_c7_4a5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1546_c7_4a5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1546_c7_4a5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- t16_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_6244] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_return_output := result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_6244_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     t16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     t16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := t16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1536_c7_c177] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1536_c7_c177_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := t16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1531_c7_1ef1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_1ef1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1528_c7_f396] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1528_c7_f396_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c2_25b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1561_l1518_DUPLICATE_a738 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1561_l1518_DUPLICATE_a738_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c2_25b9_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1561_l1518_DUPLICATE_a738_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1561_l1518_DUPLICATE_a738_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
