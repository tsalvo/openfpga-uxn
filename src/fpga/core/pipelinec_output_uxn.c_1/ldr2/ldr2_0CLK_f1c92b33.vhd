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
-- Submodules: 82
entity ldr2_0CLK_f1c92b33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_f1c92b33;
architecture arch of ldr2_0CLK_f1c92b33 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1765_c6_b92f]
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1765_c2_8657]
signal t8_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1765_c2_8657]
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1765_c2_8657]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1765_c2_8657]
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1765_c2_8657]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1765_c2_8657]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1765_c2_8657]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1765_c2_8657]
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c2_8657]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_75cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_bc0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_046d]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1773_c7_660b]
signal t8_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1773_c7_660b]
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_660b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_660b]
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_660b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_660b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_660b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1773_c7_660b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_660b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1776_c32_0f18]
signal BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1776_c32_e3f9]
signal BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1776_c32_2501]
signal MUX_uxn_opcodes_h_l1776_c32_2501_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1776_c32_2501_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1776_c32_2501_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1776_c32_2501_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1777_c21_fdcf]
signal BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_1af8]
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1779_c7_ef22]
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1779_c7_ef22]
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_ef22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_ef22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_ef22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1779_c7_ef22]
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_ef22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_e9a0]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1783_c7_16a7]
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_16a7]
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_16a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_16a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1783_c7_16a7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_16a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1785_c3_b1bd]
signal CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1786_c21_d986]
signal BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1788_c11_1002]
signal BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1788_c7_0069]
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1788_c7_0069]
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1788_c7_0069]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1788_c7_0069]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1788_c7_0069]
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1788_c7_0069]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1789_c21_e7f2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_5540]
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1791_c7_4381]
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1791_c7_4381]
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_4381]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_4381]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_4381]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1792_c3_0c60]
signal BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_4818]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1797_c7_96f2]
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_96f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_96f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_96f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1799_c34_4af5]
signal CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_ea58]
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_2011]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_2011]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_left,
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_right,
BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output);

-- t8_MUX_uxn_opcodes_h_l1765_c2_8657
t8_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
t8_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
t8_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
t8_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1765_c2_8657
tmp16_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output);

-- t8_MUX_uxn_opcodes_h_l1770_c7_bc0c
t8_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c
tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output);

-- t8_MUX_uxn_opcodes_h_l1773_c7_660b
t8_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
t8_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
t8_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
t8_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1773_c7_660b
tmp16_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18
BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_left,
BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_right,
BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9
BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_left,
BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_right,
BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_return_output);

-- MUX_uxn_opcodes_h_l1776_c32_2501
MUX_uxn_opcodes_h_l1776_c32_2501 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1776_c32_2501_cond,
MUX_uxn_opcodes_h_l1776_c32_2501_iftrue,
MUX_uxn_opcodes_h_l1776_c32_2501_iffalse,
MUX_uxn_opcodes_h_l1776_c32_2501_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_left,
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_right,
BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_left,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_right,
BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22
tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_cond,
tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue,
tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse,
tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_cond,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7
tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_cond,
tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd
CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_x,
CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_left,
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_right,
BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_left,
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_right,
BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1788_c7_0069
tmp16_MUX_uxn_opcodes_h_l1788_c7_0069 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_cond,
tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue,
tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse,
tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_cond,
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_left,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_right,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1791_c7_4381
tmp16_MUX_uxn_opcodes_h_l1791_c7_4381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_cond,
tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue,
tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse,
tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_cond,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60
BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_left,
BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_right,
BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5
CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_x,
CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_left,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_right,
BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output,
 t8_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output,
 t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output,
 t8_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_return_output,
 MUX_uxn_opcodes_h_l1776_c32_2501_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output,
 CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output,
 tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output,
 tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output,
 CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_b774 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_ef66 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_70f4 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_2501_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_2501_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_2501_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1776_c32_2501_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1777_c26_04df_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1781_c3_728f : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1786_c3_63c1 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1789_c3_f923 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_ddc1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_428e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_9db9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1799_c24_e521_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1770_l1773_l1765_DUPLICATE_80ed_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1770_l1765_DUPLICATE_36b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1770_l1788_l1765_DUPLICATE_1558_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1789_l1786_l1781_DUPLICATE_51b5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1792_l1784_DUPLICATE_d2b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1760_l1806_DUPLICATE_29fa_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_b774 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1767_c3_b774;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_ef66 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_ef66;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_ddc1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1794_c3_ddc1;
     VAR_MUX_uxn_opcodes_h_l1776_c32_2501_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_9db9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_9db9;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1776_c32_2501_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_4818] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1770_l1788_l1765_DUPLICATE_1558 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1770_l1788_l1765_DUPLICATE_1558_return_output := result.ram_addr;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1789_l1786_l1781_DUPLICATE_51b5 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1789_l1786_l1781_DUPLICATE_51b5_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1792_l1784_DUPLICATE_d2b9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1792_l1784_DUPLICATE_d2b9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_75cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1776_c32_0f18] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_left;
     BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_return_output := BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1799_c34_4af5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_return_output := CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1770_l1765_DUPLICATE_36b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1770_l1765_DUPLICATE_36b1_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1801_c11_ea58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_left;
     BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output := BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1770_l1773_l1765_DUPLICATE_80ed LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1770_l1773_l1765_DUPLICATE_80ed_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1777_c26_04df] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1777_c26_04df_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_046d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1788_c11_1002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_left;
     BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output := BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1779_c11_1af8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_e9a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_5540] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_left;
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output := BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1765_c6_b92f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1776_c32_0f18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c6_b92f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_75cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_046d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1779_c11_1af8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_e9a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1788_c11_1002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_5540_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_4818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1801_c11_ea58_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1777_c26_04df_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1789_l1786_l1781_DUPLICATE_51b5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1792_l1784_DUPLICATE_d2b9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1792_l1784_DUPLICATE_d2b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1770_l1773_l1765_DUPLICATE_80ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1770_l1773_l1765_DUPLICATE_80ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1770_l1773_l1765_DUPLICATE_80ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1770_l1788_l1765_DUPLICATE_1558_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1770_l1788_l1765_DUPLICATE_1558_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1770_l1788_l1765_DUPLICATE_1558_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1791_l1788_DUPLICATE_7fe3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1770_l1765_DUPLICATE_36b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1770_l1765_DUPLICATE_36b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1779_l1770_l1765_DUPLICATE_36b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1801_l1770_l1797_l1765_l1788_DUPLICATE_528f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1797_l1788_DUPLICATE_eab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1783_l1779_l1773_l1770_l1797_l1765_l1788_DUPLICATE_df48_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_96f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1801_c7_2011] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1776_c32_e3f9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_left;
     BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_return_output := BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1777_c21_fdcf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_return_output;

     -- t8_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     t8_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     t8_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := t8_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1799_c24_e521] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1799_c24_e521_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1799_c34_4af5_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1801_c7_2011] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1792_c3_0c60] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_left;
     BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output := BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1785_c3_b1bd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_return_output := CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1779_c7_ef22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1776_c32_2501_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1776_c32_e3f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_70f4 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1777_c21_fdcf_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1781_c3_728f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1786_l1781_l1789_DUPLICATE_8d5e_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1799_c24_e521_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1785_c3_b1bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1801_c7_2011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1801_c7_2011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1777_c3_70f4;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1781_c3_728f;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1786_c21_d986] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_return_output;

     -- t8_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1795_c24_428e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_428e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1792_c3_0c60_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1791_c7_4381] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_cond;
     tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_return_output := tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_4381] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1789_c21_e7f2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1797_c7_96f2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_96f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- MUX[uxn_opcodes_h_l1776_c32_2501] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1776_c32_2501_cond <= VAR_MUX_uxn_opcodes_h_l1776_c32_2501_cond;
     MUX_uxn_opcodes_h_l1776_c32_2501_iftrue <= VAR_MUX_uxn_opcodes_h_l1776_c32_2501_iftrue;
     MUX_uxn_opcodes_h_l1776_c32_2501_iffalse <= VAR_MUX_uxn_opcodes_h_l1776_c32_2501_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1776_c32_2501_return_output := MUX_uxn_opcodes_h_l1776_c32_2501_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_96f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1786_c3_63c1 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1786_c21_d986_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1789_c3_f923 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1789_c21_e7f2_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1795_c24_428e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue := VAR_MUX_uxn_opcodes_h_l1776_c32_2501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1797_c7_96f2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1786_c3_63c1;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1789_c3_f923;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1788_c7_0069] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1791_c7_4381] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_return_output := result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1788_c7_0069] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     t8_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     t8_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := t8_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1788_c7_0069] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_cond;
     tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_return_output := tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_4381] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_4381] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1791_c7_4381_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1783_c7_16a7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_16a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1783_c7_16a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_cond;
     tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output := tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1788_c7_0069] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1788_c7_0069] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1788_c7_0069] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_return_output := result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1788_c7_0069_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_16a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1779_c7_ef22] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_16a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1779_c7_ef22] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_cond;
     tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output := tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1779_c7_ef22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_16a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_16a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1779_c7_ef22] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output := result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1779_c7_ef22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1779_c7_ef22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1779_c7_ef22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_660b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_660b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1770_c7_bc0c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_bc0c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c2_8657] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1760_l1806_DUPLICATE_29fa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1760_l1806_DUPLICATE_29fa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a287(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c2_8657_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c2_8657_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1760_l1806_DUPLICATE_29fa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a287_uxn_opcodes_h_l1760_l1806_DUPLICATE_29fa_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
