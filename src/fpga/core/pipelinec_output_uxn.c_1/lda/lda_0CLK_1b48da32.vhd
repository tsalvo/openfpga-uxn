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
-- Submodules: 74
entity lda_0CLK_1b48da32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_1b48da32;
architecture arch of lda_0CLK_1b48da32 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1513_c6_f6a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1513_c2_ccc2]
signal t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_9741]
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1518_c7_0033]
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1518_c7_0033]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1518_c7_0033]
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_0033]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1518_c7_0033]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_0033]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1518_c7_0033]
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_0033]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1518_c7_0033]
signal t16_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1521_c11_9425]
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1521_c7_5317]
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c7_5317]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1521_c7_5317]
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c7_5317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1521_c7_5317]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c7_5317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1521_c7_5317]
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c7_5317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1521_c7_5317]
signal t16_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1523_c3_24ca]
signal CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_18b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1526_c7_fecf]
signal t16_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1529_c11_b048]
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1529_c7_28e4]
signal t16_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1530_c3_36a5]
signal BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1532_c32_af58]
signal BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1532_c32_77ed]
signal BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1532_c32_465c]
signal MUX_uxn_opcodes_h_l1532_c32_465c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1532_c32_465c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1532_c32_465c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1532_c32_465c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_aec7]
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1535_c7_feef]
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_feef]
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_feef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1535_c7_feef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_feef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1535_c7_feef]
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_feef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_5728]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1539_c7_c585]
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_c585]
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_c585]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_c585]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_c585]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1545_c11_e346]
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1545_c7_75a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1545_c7_75a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a287( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2
tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- t16_MUX_uxn_opcodes_h_l1513_c2_ccc2
t16_MUX_uxn_opcodes_h_l1513_c2_ccc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond,
t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue,
t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse,
t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_left,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_right,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1518_c7_0033
tmp8_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- t16_MUX_uxn_opcodes_h_l1518_c7_0033
t16_MUX_uxn_opcodes_h_l1518_c7_0033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1518_c7_0033_cond,
t16_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue,
t16_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse,
t16_MUX_uxn_opcodes_h_l1518_c7_0033_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_left,
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_right,
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1521_c7_5317
tmp8_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- t16_MUX_uxn_opcodes_h_l1521_c7_5317
t16_MUX_uxn_opcodes_h_l1521_c7_5317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1521_c7_5317_cond,
t16_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue,
t16_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse,
t16_MUX_uxn_opcodes_h_l1521_c7_5317_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca
CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_x,
CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf
tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- t16_MUX_uxn_opcodes_h_l1526_c7_fecf
t16_MUX_uxn_opcodes_h_l1526_c7_fecf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1526_c7_fecf_cond,
t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue,
t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse,
t16_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_left,
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_right,
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4
tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- t16_MUX_uxn_opcodes_h_l1529_c7_28e4
t16_MUX_uxn_opcodes_h_l1529_c7_28e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1529_c7_28e4_cond,
t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue,
t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse,
t16_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5
BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_left,
BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_right,
BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58
BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_left,
BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_right,
BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed
BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_left,
BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_right,
BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_return_output);

-- MUX_uxn_opcodes_h_l1532_c32_465c
MUX_uxn_opcodes_h_l1532_c32_465c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1532_c32_465c_cond,
MUX_uxn_opcodes_h_l1532_c32_465c_iftrue,
MUX_uxn_opcodes_h_l1532_c32_465c_iffalse,
MUX_uxn_opcodes_h_l1532_c32_465c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_left,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_right,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1535_c7_feef
tmp8_MUX_uxn_opcodes_h_l1535_c7_feef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_cond,
tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue,
tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse,
tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_cond,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1539_c7_c585
tmp8_MUX_uxn_opcodes_h_l1539_c7_c585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_cond,
tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue,
tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse,
tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_cond,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_left,
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_right,
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output,
 tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output,
 tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 t16_MUX_uxn_opcodes_h_l1518_c7_0033_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output,
 tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 t16_MUX_uxn_opcodes_h_l1521_c7_5317_return_output,
 CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 t16_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output,
 tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 t16_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_return_output,
 MUX_uxn_opcodes_h_l1532_c32_465c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output,
 tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output,
 tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_f369 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_3001 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_3a5f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_e322 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_465c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_465c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_465c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_465c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1542_c3_4970 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1522_l1530_DUPLICATE_932a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1529_l1539_DUPLICATE_bff5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1550_l1508_DUPLICATE_d247_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_e322 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_e322;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_3a5f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_3a5f;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_3001 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_3001;
     VAR_MUX_uxn_opcodes_h_l1532_c32_465c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1532_c32_465c_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_f369 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_f369;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1542_c3_4970 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1542_c3_4970;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_right := to_unsigned(4, 3);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1513_c6_f6a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_5728] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_9741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_left;
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output := BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1521_c11_9425] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_left;
     BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output := BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1529_l1539_DUPLICATE_bff5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1529_l1539_DUPLICATE_bff5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1529_c11_b048] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_left;
     BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output := BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_18b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1545_c11_e346] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_left;
     BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output := BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_aec7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1532_c32_af58] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_left;
     BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_return_output := BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1522_l1530_DUPLICATE_932a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1522_l1530_DUPLICATE_932a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_af58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_f6a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_9741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_9425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_18b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_b048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_aec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_5728_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_e346_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1522_l1530_DUPLICATE_932a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1522_l1530_DUPLICATE_932a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1521_l1526_l1529_l1518_l1513_DUPLICATE_eed2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_eeb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1545_l1518_DUPLICATE_49ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1518_l1513_DUPLICATE_8f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1529_l1545_l1518_l1513_DUPLICATE_4b18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1529_l1539_DUPLICATE_bff5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1529_l1539_DUPLICATE_bff5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1529_l1539_DUPLICATE_bff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1521_l1526_l1539_l1529_l1518_l1513_DUPLICATE_b35d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_c585] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1545_c7_75a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1530_c3_36a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_left;
     BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output := BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1523_c3_24ca] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_return_output := CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1535_c7_feef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1539_c7_c585] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_cond;
     tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_return_output := tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_c585] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_return_output := result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1535_c7_feef] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1545_c7_75a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1532_c32_77ed] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_left;
     BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_return_output := BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1532_c32_465c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_77ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_36a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_24ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_75a4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := t16_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- MUX[uxn_opcodes_h_l1532_c32_465c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1532_c32_465c_cond <= VAR_MUX_uxn_opcodes_h_l1532_c32_465c_cond;
     MUX_uxn_opcodes_h_l1532_c32_465c_iftrue <= VAR_MUX_uxn_opcodes_h_l1532_c32_465c_iftrue;
     MUX_uxn_opcodes_h_l1532_c32_465c_iffalse <= VAR_MUX_uxn_opcodes_h_l1532_c32_465c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1532_c32_465c_return_output := MUX_uxn_opcodes_h_l1532_c32_465c_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1535_c7_feef] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_cond;
     tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_return_output := tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_c585] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_feef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_c585] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_feef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_return_output := result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue := VAR_MUX_uxn_opcodes_h_l1532_c32_465c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_c585_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_feef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_feef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := t16_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_feef_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- t16_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     t16_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     t16_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := t16_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1529_c7_28e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_28e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- t16_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     t16_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     t16_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := t16_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1526_c7_fecf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_fecf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- t16_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c7_5317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_5317_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_0033] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0033_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1513_c2_ccc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1550_l1508_DUPLICATE_d247 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1550_l1508_DUPLICATE_d247_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a287(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_ccc2_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1550_l1508_DUPLICATE_d247_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1550_l1508_DUPLICATE_d247_return_output;
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
