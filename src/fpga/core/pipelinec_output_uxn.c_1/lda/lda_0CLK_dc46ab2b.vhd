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
-- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_c769]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_6c5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_e570]
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_e570]
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_e570]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_e570]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_e570]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_e570]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_e570]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1330_c2_e570]
signal t16_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1330_c2_e570]
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1331_c3_aa18[uxn_opcodes_h_l1331_c3_aa18]
signal printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_ab9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal t16_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1335_c7_9d74]
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_2089]
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal t16_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1338_c7_4f81]
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1340_c3_cf51]
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_19fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_39be]
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_39be]
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_39be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_39be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_39be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_39be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_39be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1342_c7_39be]
signal t16_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1342_c7_39be]
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1343_c3_e08a]
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1345_c30_a287]
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_63c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_93c8]
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_93c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_93c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_93c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_93c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1348_c7_93c8]
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_9d63]
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_8e47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_8e47]
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_8e47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_8e47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1351_c7_8e47]
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_f3a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_8dcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_8dcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a310( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- t16_MUX_uxn_opcodes_h_l1330_c2_e570
t16_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
t16_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
t16_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
t16_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1330_c2_e570
tmp8_MUX_uxn_opcodes_h_l1330_c2_e570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_cond,
tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue,
tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse,
tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

-- printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18
printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18 : entity work.printf_uxn_opcodes_h_l1331_c3_aa18_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- t16_MUX_uxn_opcodes_h_l1335_c7_9d74
t16_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
t16_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74
tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_cond,
tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue,
tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse,
tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_left,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_right,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- t16_MUX_uxn_opcodes_h_l1338_c7_4f81
t16_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
t16_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81
tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_cond,
tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue,
tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse,
tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51
CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_x,
CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- t16_MUX_uxn_opcodes_h_l1342_c7_39be
t16_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
t16_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
t16_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
t16_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1342_c7_39be
tmp8_MUX_uxn_opcodes_h_l1342_c7_39be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_cond,
tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue,
tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse,
tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a
BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_left,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_right,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1345_c30_a287
sp_relative_shift_uxn_opcodes_h_l1345_c30_a287 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_ins,
sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_x,
sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_y,
sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8
tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_cond,
tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_left,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_right,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_cond,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47
tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_cond,
tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue,
tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse,
tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 t16_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 t16_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 t16_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output,
 CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 t16_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output,
 tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output,
 tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_3465 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_d4a6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_56a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_432e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1335_l1348_l1338_l1330_DUPLICATE_500d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_7b83_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_8421_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1342_l1348_l1338_l1351_DUPLICATE_eb8e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1362_l1325_DUPLICATE_b684_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_56a5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_56a5;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_d4a6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_d4a6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_3465 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_3465;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse := tmp8;
     -- sp_relative_shift[uxn_opcodes_h_l1345_c30_a287] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_ins;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_x;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_return_output := sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_19fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_ab9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_c769] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1335_l1348_l1338_l1330_DUPLICATE_500d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1335_l1348_l1338_l1330_DUPLICATE_500d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_432e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_432e_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1342_l1348_l1338_l1351_DUPLICATE_eb8e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1342_l1348_l1338_l1351_DUPLICATE_eb8e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_2089] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_left;
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output := BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_7b83 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_7b83_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_63c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_8421 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_8421_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_9d63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_left;
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output := BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_f3a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_c769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_ab9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_2089_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_19fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_63c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_9d63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_f3a8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_8421_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_8421_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_7b83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_7b83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_7b83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_7b83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_432e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_432e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_432e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1342_l1335_l1338_l1330_DUPLICATE_432e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_dc38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1335_l1348_l1338_l1330_DUPLICATE_500d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1335_l1348_l1338_l1330_DUPLICATE_500d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1335_l1348_l1338_l1330_DUPLICATE_500d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1335_l1348_l1338_l1330_DUPLICATE_500d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1348_l1342_l1338_l1335_l1330_DUPLICATE_793f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1342_l1348_l1338_l1351_DUPLICATE_eb8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1342_l1348_l1338_l1351_DUPLICATE_eb8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1342_l1348_l1338_l1351_DUPLICATE_eb8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1342_l1348_l1338_l1351_DUPLICATE_eb8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_58e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_a287_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_8e47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output := result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1351_c7_8e47] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_cond;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output := tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_8e47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1343_c3_e08a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_left;
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output := BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_8dcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_8dcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_93c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1340_c3_cf51] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_return_output := CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_6c5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_e08a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_cf51_return_output;
     VAR_printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_6c5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_8dcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_93c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_8e47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;

     -- printf_uxn_opcodes_h_l1331_c3_aa18[uxn_opcodes_h_l1331_c3_aa18] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1331_c3_aa18_uxn_opcodes_h_l1331_c3_aa18_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     t16_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     t16_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := t16_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_93c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1348_c7_93c8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_cond;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output := tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_8e47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_8e47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_93c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- t16_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := t16_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_93c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_93c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_39be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- t16_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := t16_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_39be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_4f81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- t16_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     t16_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     t16_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := t16_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_4f81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_9d74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_9d74_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_e570] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1362_l1325_DUPLICATE_b684 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1362_l1325_DUPLICATE_b684_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a310(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_e570_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_e570_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1362_l1325_DUPLICATE_b684_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1362_l1325_DUPLICATE_b684_return_output;
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
