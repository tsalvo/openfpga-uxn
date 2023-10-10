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
-- Submodules: 108
entity lda2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_5fcb251d;
architecture arch of lda2_0CLK_5fcb251d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1973_c6_9404]
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1973_c1_93c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal t16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1973_c2_8d70]
signal tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1974_c3_4620[uxn_opcodes_h_l1974_c3_4620]
signal printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1979_c11_c987]
signal BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1979_c7_a388]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1979_c7_a388]
signal t16_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1979_c7_a388]
signal tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1982_c11_aa77]
signal BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1982_c7_060e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1982_c7_060e]
signal t16_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1982_c7_060e]
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1984_c3_8d72]
signal CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1987_c11_462a]
signal BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal t16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1987_c7_10f2]
signal tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_cb0d]
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_109d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1990_c7_109d]
signal t16_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1990_c7_109d]
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1991_c3_23b1]
signal BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1994_c32_8dcc]
signal BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1994_c32_40be]
signal BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1994_c32_4750]
signal MUX_uxn_opcodes_h_l1994_c32_4750_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1994_c32_4750_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1994_c32_4750_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1994_c32_4750_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_0d51]
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1997_c7_3241]
signal result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c7_3241]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_3241]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_3241]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_3241]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1997_c7_3241]
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1997_c7_3241]
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_9bb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2001_c7_eda0]
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_eda0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_eda0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_eda0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_eda0]
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2001_c7_eda0]
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2003_c3_f6d6]
signal CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2004_c21_26c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_1909]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2006_c7_4926]
signal result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_4926]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_4926]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_4926]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2006_c7_4926]
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2006_c7_4926]
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2007_c21_2796]
signal BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_8bb9]
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_d651]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_d651]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_d651]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_d651]
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2009_c7_d651]
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2010_c3_01f1]
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_c360]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_d04d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_d04d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_d04d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2015_c7_d04d]
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2017_c34_87a2]
signal CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_e546]
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2019_c7_3de5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2019_c7_3de5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2155( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404
BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_left,
BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_right,
BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70
result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70
result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70
result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- t16_MUX_uxn_opcodes_h_l1973_c2_8d70
t16_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
t16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70
tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond,
tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue,
tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse,
tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

-- printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620
printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620 : entity work.printf_uxn_opcodes_h_l1974_c3_4620_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987
BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_left,
BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_right,
BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388
result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388
result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388
result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388
result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388
result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388
result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388
result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- t16_MUX_uxn_opcodes_h_l1979_c7_a388
t16_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
t16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
t16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
t16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1979_c7_a388
tmp16_MUX_uxn_opcodes_h_l1979_c7_a388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_cond,
tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue,
tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse,
tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_left,
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_right,
BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e
result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e
result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e
result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- t16_MUX_uxn_opcodes_h_l1982_c7_060e
t16_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
t16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
t16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
t16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1982_c7_060e
tmp16_MUX_uxn_opcodes_h_l1982_c7_060e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_cond,
tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72
CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_x,
CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_left,
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_right,
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2
result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2
result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2
result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- t16_MUX_uxn_opcodes_h_l1987_c7_10f2
t16_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
t16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2
tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond,
tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_left,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_right,
BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d
result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d
result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d
result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- t16_MUX_uxn_opcodes_h_l1990_c7_109d
t16_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
t16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
t16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
t16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1990_c7_109d
tmp16_MUX_uxn_opcodes_h_l1990_c7_109d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_cond,
tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1
BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_left,
BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_right,
BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc
BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_left,
BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_right,
BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be
BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_left,
BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_right,
BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_return_output);

-- MUX_uxn_opcodes_h_l1994_c32_4750
MUX_uxn_opcodes_h_l1994_c32_4750 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1994_c32_4750_cond,
MUX_uxn_opcodes_h_l1994_c32_4750_iftrue,
MUX_uxn_opcodes_h_l1994_c32_4750_iffalse,
MUX_uxn_opcodes_h_l1994_c32_4750_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_left,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_right,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241
result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_cond,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1997_c7_3241
tmp16_MUX_uxn_opcodes_h_l1997_c7_3241 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_cond,
tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue,
tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse,
tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0
tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_cond,
tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6
CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_x,
CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8
BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926
result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_cond,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2006_c7_4926
tmp16_MUX_uxn_opcodes_h_l2006_c7_4926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_cond,
tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue,
tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse,
tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796
BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_left,
BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_right,
BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_left,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_right,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_cond,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2009_c7_d651
tmp16_MUX_uxn_opcodes_h_l2009_c7_d651 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_cond,
tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue,
tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse,
tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1
BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_left,
BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_right,
BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2
CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_x,
CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_left,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_right,
BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 t16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 t16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 t16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output,
 CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 t16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 t16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_return_output,
 MUX_uxn_opcodes_h_l1994_c32_4750_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_return_output,
 tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output,
 CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_return_output,
 tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_return_output,
 tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_347a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_1c4e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1985_c3_3b32 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_fe30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c32_4750_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c32_4750_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c32_4750_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1994_c32_4750_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2004_c3_7065 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2007_c3_eb62 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_894b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c24_697e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2016_c3_79c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2017_c24_cb80_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1990_l1982_l1987_l1979_DUPLICATE_7b17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1983_l1991_DUPLICATE_2f4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2010_DUPLICATE_6405_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1969_l2024_DUPLICATE_ebd4_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1994_c32_4750_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_894b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2012_c3_894b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1994_c32_4750_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_347a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_347a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_1c4e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_1c4e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_fe30 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_fe30;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_right := to_unsigned(10, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1985_c3_3b32 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1985_c3_3b32;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2016_c3_79c1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2016_c3_79c1;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1990_c11_cb0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2004_c21_26c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1990_l1982_l1987_l1979_DUPLICATE_7b17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1990_l1982_l1987_l1979_DUPLICATE_7b17_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1973_c6_9404] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_left;
     BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output := BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1979_c11_c987] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_left;
     BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output := BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1987_c11_462a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1983_l1991_DUPLICATE_2f4f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1983_l1991_DUPLICATE_2f4f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_9bb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_8bb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2019_c11_e546] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_left;
     BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output := BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_1909] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1982_c11_aa77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_0d51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_left;
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output := BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_c360] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2007_c21_2796] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1994_c32_8dcc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_left;
     BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_return_output := BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2017_c34_87a2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_return_output := CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2010_DUPLICATE_6405 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2010_DUPLICATE_6405_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1994_c32_8dcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c6_9404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1979_c11_c987_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1982_c11_aa77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_462a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1990_c11_cb0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_0d51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_9bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_1909_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_8bb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_c360_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2019_c11_e546_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2004_c3_7065 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2004_c21_26c8_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l2007_c3_eb62 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2007_c21_2796_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1983_l1991_DUPLICATE_2f4f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1983_l1991_DUPLICATE_2f4f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2010_DUPLICATE_6405_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2010_DUPLICATE_6405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1990_l1987_DUPLICATE_36f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l1987_DUPLICATE_ec07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1982_l2009_l1979_l2006_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_dcdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1982_l1979_l1973_l1997_l1987_DUPLICATE_a34a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1990_l1982_l1987_l1979_DUPLICATE_7b17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1990_l1982_l1987_l1979_DUPLICATE_7b17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1990_l1982_l1987_l1979_DUPLICATE_7b17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1990_l1982_l1987_l1979_DUPLICATE_7b17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l2019_l1987_l2015_DUPLICATE_516c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2006_l2001_l1997_l1990_l2015_DUPLICATE_891b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1982_l1979_l2006_l1973_l2001_l1997_l1990_l1987_l2015_DUPLICATE_5f22_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2004_c3_7065;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2007_c3_eb62;
     -- BIN_OP_OR[uxn_opcodes_h_l1991_c3_23b1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_left;
     BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output := BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_d04d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2006_c7_4926] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2017_c24_cb80] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2017_c24_cb80_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2017_c34_87a2_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2010_c3_01f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_left;
     BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output := BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c7_3241] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2003_c3_f6d6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_return_output := CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1984_c3_8d72] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_return_output := CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1973_c1_93c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2019_c7_3de5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2019_c7_3de5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1994_c32_40be] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_left;
     BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_return_output := BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1994_c32_4750_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1994_c32_40be_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1991_c3_23b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2017_c24_cb80_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1984_c3_8d72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2003_c3_f6d6_return_output;
     VAR_printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1973_c1_93c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2019_c7_3de5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2013_c24_697e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c24_697e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_01f1_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_d651] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- MUX[uxn_opcodes_h_l1994_c32_4750] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1994_c32_4750_cond <= VAR_MUX_uxn_opcodes_h_l1994_c32_4750_cond;
     MUX_uxn_opcodes_h_l1994_c32_4750_iftrue <= VAR_MUX_uxn_opcodes_h_l1994_c32_4750_iftrue;
     MUX_uxn_opcodes_h_l1994_c32_4750_iffalse <= VAR_MUX_uxn_opcodes_h_l1994_c32_4750_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1994_c32_4750_return_output := MUX_uxn_opcodes_h_l1994_c32_4750_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2001_c7_eda0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2015_c7_d04d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;

     -- printf_uxn_opcodes_h_l1974_c3_4620[uxn_opcodes_h_l1974_c3_4620] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1974_c3_4620_uxn_opcodes_h_l1974_c3_4620_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l2009_c7_d651] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_cond;
     tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_return_output := tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_d04d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_d04d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     t16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     t16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := t16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2013_c24_697e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue := VAR_MUX_uxn_opcodes_h_l1994_c32_4750_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_d04d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_d651] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1997_c7_3241] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_d651] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_return_output := result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;

     -- t16_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := t16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_d651] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2006_c7_4926] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_cond;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_return_output := tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_4926] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_d651_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2001_c7_eda0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_cond;
     tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output := tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_4926] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2006_c7_4926] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_return_output := result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- t16_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     t16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     t16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := t16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_eda0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_4926] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_4926_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;
     -- t16_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     t16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     t16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := t16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1997_c7_3241] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_cond;
     tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_return_output := tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_eda0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_eda0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_eda0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_3241] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_eda0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_3241] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1997_c7_3241] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_return_output := result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_3241] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;

     -- t16_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := t16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_3241_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1990_c7_109d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1990_c7_109d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1987_c7_10f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_10f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1982_c7_060e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1982_c7_060e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1979_c7_a388] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_return_output := result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1979_c7_a388_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1973_c2_8d70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1969_l2024_DUPLICATE_ebd4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1969_l2024_DUPLICATE_ebd4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2155(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c2_8d70_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1969_l2024_DUPLICATE_ebd4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1969_l2024_DUPLICATE_ebd4_return_output;
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
