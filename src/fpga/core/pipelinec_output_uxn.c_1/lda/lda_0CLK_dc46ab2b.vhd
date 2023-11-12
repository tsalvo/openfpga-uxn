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
-- Submodules: 63
entity lda_0CLK_dc46ab2b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_dc46ab2b;
architecture arch of lda_0CLK_dc46ab2b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_bbc2]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_0f93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1330_c2_c049]
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1330_c2_c049]
signal t16_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_c049]
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_c049]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_c049]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_c049]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_c049]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_c049]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_c049]
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1331_c3_52a2[uxn_opcodes_h_l1331_c3_52a2]
signal printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_e2e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal t16_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_9fed]
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_7707]
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal t16_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_7dda]
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1340_c3_9503]
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_1ebd]
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_ef7d]
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1343_c3_b289]
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1345_c30_f1e2]
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_00e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1348_c7_4918]
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_4918]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_4918]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_4918]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_4918]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_4918]
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_f02d]
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1351_c7_e3d5]
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_e3d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_e3d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_e3d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_e3d5]
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_d4b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_58f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_58f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1330_c2_c049
tmp8_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- t16_MUX_uxn_opcodes_h_l1330_c2_c049
t16_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
t16_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
t16_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
t16_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

-- printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2
printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2 : entity work.printf_uxn_opcodes_h_l1331_c3_52a2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed
tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- t16_MUX_uxn_opcodes_h_l1335_c7_9fed
t16_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
t16_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_left,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_right,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda
tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- t16_MUX_uxn_opcodes_h_l1338_c7_7dda
t16_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
t16_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1340_c3_9503
CONST_SL_8_uxn_opcodes_h_l1340_c3_9503 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_x,
CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_left,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_right,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d
tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- t16_MUX_uxn_opcodes_h_l1342_c7_ef7d
t16_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289
BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_left,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_right,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2
sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_ins,
sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_x,
sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_y,
sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1348_c7_4918
tmp8_MUX_uxn_opcodes_h_l1348_c7_4918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_cond,
tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue,
tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse,
tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_cond,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_left,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_right,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5
tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond,
tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_return_output,
 tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 t16_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 t16_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output,
 tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 t16_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output,
 CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output,
 tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output,
 sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output,
 tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output,
 tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_3cf2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_8b6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_0b77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_b1f3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_0bbe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_8753_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_458a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_0e38_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1362_l1325_DUPLICATE_548a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_0b77 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_0b77;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_3cf2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_3cf2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_8b6d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_8b6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_e2e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_b1f3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_b1f3_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_00e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_8753 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_8753_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_7707] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_left;
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output := BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_d4b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_0bbe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_0bbe_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_1ebd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_458a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_458a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_0e38 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_0e38_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_bbc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1345_c30_f1e2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_ins;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_x;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_return_output := sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_f02d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_bbc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_e2e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_7707_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_1ebd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_00e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_f02d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_d4b4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_458a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_458a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_8753_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_8753_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_8753_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_8753_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_b1f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_b1f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_b1f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_b1f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_f904_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_0bbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_0bbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_0bbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_0bbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_8386_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_0e38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_0e38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_0e38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_0e38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_fa5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_f1e2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_58f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1351_c7_e3d5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output := tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1340_c3_9503] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_return_output := CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_e3d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1343_c3_b289] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_left;
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output := BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_58f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_e3d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_0f93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_4918] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_b289_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_9503_return_output;
     VAR_printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_0f93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_58f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_e3d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1348_c7_4918] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_cond;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_return_output := tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;

     -- printf_uxn_opcodes_h_l1331_c3_52a2[uxn_opcodes_h_l1331_c3_52a2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1331_c3_52a2_uxn_opcodes_h_l1331_c3_52a2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_4918] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_4918] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_return_output := result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_e3d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_e3d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_4918] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := t16_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_4918] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_4918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_ef7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- t16_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := t16_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_ef7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- t16_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     t16_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     t16_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := t16_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_7dda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_7dda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_9fed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9fed_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_c049] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1362_l1325_DUPLICATE_548a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1362_l1325_DUPLICATE_548a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_c049_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_c049_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1362_l1325_DUPLICATE_548a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1362_l1325_DUPLICATE_548a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
